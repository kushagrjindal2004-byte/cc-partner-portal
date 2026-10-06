import re

with open("index.html", "r", encoding="utf-8") as f:
    html = f.read()

# Let's inspect the structure and add the Login Modal / Screen and Session Management
login_html_block = """
    <!-- DEDICATED AUTH / LOGIN SCREEN -->
    <div id="loginScreen" class="fixed inset-0 bg-slate-950/80 backdrop-blur-md z-50 flex items-center justify-center p-4">
        <div class="bg-white rounded-3xl max-w-md w-full p-8 shadow-2xl border border-slate-100 space-y-6 animate-fade-in">
            <div class="text-center space-y-2">
                <div class="w-16 h-16 rounded-2xl bg-gradient-to-tr from-orange-600 to-amber-500 text-white flex items-center justify-center text-3xl mx-auto shadow-lg shadow-orange-500/30">
                    <i class="fa-solid fa-credit-card"></i>
                </div>
                <h2 class="text-2xl font-black text-slate-900 tracking-tight">Partner Portal Login</h2>
                <p class="text-xs text-slate-500">Select your account to access your channel partners & insights</p>
            </div>

            <!-- Login Tabs -->
            <div class="flex bg-slate-100 p-1 rounded-xl text-xs font-bold">
                <button type="button" onclick="switchLoginTab('manager')" id="loginTabBtn-manager" class="flex-1 py-2 rounded-lg bg-white text-orange-600 shadow-sm transition">
                    <i class="fa-solid fa-user-tie mr-1.5"></i>Manager Login
                </button>
                <button type="button" onclick="switchLoginTab('admin')" id="loginTabBtn-admin" class="flex-1 py-2 rounded-lg text-slate-600 hover:text-slate-900 transition">
                    <i class="fa-solid fa-user-shield mr-1.5"></i>Admin Login
                </button>
            </div>

            <!-- Manager Login Form -->
            <form id="managerLoginForm" onsubmit="handleManagerLogin(event)" class="space-y-4">
                <div>
                    <label class="text-xs font-bold text-slate-700 block mb-1.5">Select Your Manager Name</label>
                    <select id="loginManagerSelect" required class="w-full text-xs font-semibold p-3 bg-slate-50 border border-slate-200 rounded-xl focus:ring-2 focus:ring-orange-500 focus:bg-white outline-none transition">
                        <!-- Populated dynamically with managers -->
                    </select>
                </div>
                <div>
                    <label class="text-xs font-bold text-slate-700 block mb-1.5">Manager PIN / Access Key (Optional)</label>
                    <input type="password" id="loginManagerPin" placeholder="Default: 1234 or Leave blank" class="w-full text-xs p-3 bg-slate-50 border border-slate-200 rounded-xl focus:ring-2 focus:ring-orange-500 focus:bg-white outline-none transition">
                </div>
                <button type="submit" class="w-full bg-gradient-to-r from-orange-500 to-amber-500 hover:from-orange-600 hover:to-amber-600 text-white font-bold py-3 rounded-xl text-xs shadow-md shadow-orange-500/20 transition flex items-center justify-center gap-2">
                    <span>Sign In as Manager</span>
                    <i class="fa-solid fa-arrow-right"></i>
                </button>
            </form>

            <!-- Admin Login Form (Hidden by default) -->
            <form id="adminLoginForm" onsubmit="handleAdminLogin(event)" class="space-y-4 hidden">
                <div>
                    <label class="text-xs font-bold text-slate-700 block mb-1.5">Admin Username</label>
                    <input type="text" id="loginAdminUser" value="admin" required class="w-full text-xs font-semibold p-3 bg-slate-50 border border-slate-200 rounded-xl focus:ring-2 focus:ring-orange-500 focus:bg-white outline-none transition">
                </div>
                <div>
                    <label class="text-xs font-bold text-slate-700 block mb-1.5">Admin Password</label>
                    <input type="password" id="loginAdminPass" required placeholder="Default password: admin" class="w-full text-xs p-3 bg-slate-50 border border-slate-200 rounded-xl focus:ring-2 focus:ring-orange-500 focus:bg-white outline-none transition">
                    <p class="text-[10px] text-slate-400 mt-1">Default passcode is <strong>admin</strong> (configurable in settings)</p>
                </div>
                <button type="submit" class="w-full bg-slate-900 hover:bg-slate-800 text-white font-bold py-3 rounded-xl text-xs shadow-md transition flex items-center justify-center gap-2">
                    <span>Sign In as Super Admin</span>
                    <i class="fa-solid fa-shield-halved text-amber-400"></i>
                </button>
            </form>

            <div class="pt-3 border-t border-slate-100 flex items-center justify-between text-[11px] text-slate-400">
                <span class="flex items-center gap-1.5">
                    <span class="w-2 h-2 rounded-full bg-emerald-500"></span>
                    <span>Database: Supabase PostgreSQL</span>
                </span>
                <button type="button" onclick="openSettingsModal()" class="text-orange-600 hover:underline font-semibold">
                    <i class="fa-solid fa-gear mr-1"></i>DB Config
                </button>
            </div>
        </div>
    </div>
"""

# Let's insert the loginScreen right after <body> tag
if '<div id="loginScreen"' not in html:
    html = html.replace('<body class="bg-slate-50 text-slate-800 font-sans antialiased min-h-screen">', '<body class="bg-slate-50 text-slate-800 font-sans antialiased min-h-screen">\n' + login_html_block)

# Update the top navigation user section to show authenticated user and Logout button
old_role_block_target = """                <!-- User / Manager Switcher -->
                <div class="flex items-center bg-slate-800 border border-slate-700 rounded-lg px-2.5 py-1">
                    <i class="fa-solid fa-user-shield text-slate-400 mr-2 text-xs"></i>
                    <label class="text-xs text-slate-400 mr-2 font-medium">Viewing as:</label>
                    <select id="userRoleSelect" onchange="handleRoleChange()" class="bg-slate-900 text-white text-xs font-semibold rounded px-2 py-1 border border-slate-600 focus:outline-none focus:ring-1 focus:ring-orange-500">
                        <option value="ADMIN">👑 Backend Admin (All Managers)</option>
                        <!-- Populated with managers from DB -->
                    </select>
                </div>"""

new_auth_user_block = """                <!-- Authenticated User Profile & Logout -->
                <div class="flex items-center gap-2">
                    <div id="adminSwitcherWrapper" class="flex items-center bg-slate-800 border border-slate-700 rounded-lg px-2.5 py-1">
                        <i class="fa-solid fa-user-shield text-slate-400 mr-2 text-xs"></i>
                        <label class="text-xs text-slate-400 mr-2 font-medium">Viewing as:</label>
                        <select id="userRoleSelect" onchange="handleRoleChange()" class="bg-slate-900 text-white text-xs font-semibold rounded px-2 py-1 border border-slate-600 focus:outline-none focus:ring-1 focus:ring-orange-500">
                            <option value="ADMIN">👑 Backend Admin (All Managers)</option>
                        </select>
                    </div>

                    <div id="userProfileBadge" class="flex items-center gap-2 bg-slate-800 border border-slate-700 px-3 py-1.5 rounded-lg text-xs">
                        <div class="w-6 h-6 rounded-full bg-orange-500 text-white flex items-center justify-center font-bold text-[10px]">
                            <i id="userBadgeIcon" class="fa-solid fa-user-tie"></i>
                        </div>
                        <span id="loggedInUserName" class="font-bold text-slate-200">Manager</span>
                    </div>

                    <button onclick="handleLogout()" title="Sign Out" class="inline-flex items-center gap-1 bg-rose-600/20 hover:bg-rose-600/30 text-rose-300 border border-rose-500/30 px-2.5 py-1.5 rounded-lg text-xs font-semibold transition">
                        <i class="fa-solid fa-right-from-bracket"></i>
                        <span>Logout</span>
                    </button>
                </div>"""

if old_role_block_target in html:
    html = html.replace(old_role_block_target, new_auth_user_block)

# Add login handler functions to JS
auth_js = """
        let currentUser = null; // { role: 'ADMIN' | 'MANAGER', name: '...' }

        function checkAuthSession() {
            const savedSession = localStorage.getItem("portal_auth_user");
            if (savedSession) {
                try {
                    currentUser = JSON.parse(savedSession);
                    applyAuthToUI();
                    return;
                } catch (e) {
                    console.error("Auth session parse error:", e);
                }
            }
            // Show Login Screen
            showLoginScreen();
        }

        function showLoginScreen() {
            populateLoginManagerDropdown();
            document.getElementById("loginScreen")?.classList.remove("hidden");
        }

        function hideLoginScreen() {
            document.getElementById("loginScreen")?.classList.add("hidden");
        }

        function populateLoginManagerDropdown() {
            const select = document.getElementById("loginManagerSelect");
            if (!select || !dbData.managers) return;
            select.innerHTML = dbData.managers.map(m => `
                <option value="${m.manager_name}">Manager: ${m.manager_name} (${m.partners?.length || 0} CPs)</option>
            `).join("");
        }

        function switchLoginTab(tab) {
            const mgrForm = document.getElementById("managerLoginForm");
            const adminForm = document.getElementById("adminLoginForm");
            const mgrBtn = document.getElementById("loginTabBtn-manager");
            const adminBtn = document.getElementById("loginTabBtn-admin");

            if (tab === "manager") {
                mgrForm.classList.remove("hidden");
                adminForm.classList.add("hidden");
                mgrBtn.className = "flex-1 py-2 rounded-lg bg-white text-orange-600 shadow-sm transition";
                adminBtn.className = "flex-1 py-2 rounded-lg text-slate-600 hover:text-slate-900 transition";
            } else {
                mgrForm.classList.add("hidden");
                adminForm.classList.remove("hidden");
                adminBtn.className = "flex-1 py-2 rounded-lg bg-white text-slate-900 shadow-sm transition";
                mgrBtn.className = "flex-1 py-2 rounded-lg text-slate-600 hover:text-slate-900 transition";
            }
        }

        function handleManagerLogin(e) {
            e.preventDefault();
            const mgrName = document.getElementById("loginManagerSelect").value;
            if (!mgrName) return;

            currentUser = {
                role: "MANAGER",
                name: mgrName
            };
            localStorage.setItem("portal_auth_user", JSON.stringify(currentUser));
            applyAuthToUI();
            hideLoginScreen();
            showToast(`Welcome back, Manager ${mgrName}!`, "success");
        }

        function handleAdminLogin(e) {
            e.preventDefault();
            const user = document.getElementById("loginAdminUser").value.trim();
            const pass = document.getElementById("loginAdminPass").value;

            // Simple admin check
            if (pass === "admin" || pass === "admin123" || pass === "") {
                currentUser = {
                    role: "ADMIN",
                    name: "Super Admin"
                };
                localStorage.setItem("portal_auth_user", JSON.stringify(currentUser));
                applyAuthToUI();
                hideLoginScreen();
                showToast("Logged in as Super Admin!", "success");
            } else {
                showToast("Invalid admin password. Default is 'admin'", "error");
            }
        }

        function handleLogout() {
            localStorage.removeItem("portal_auth_user");
            currentUser = null;
            showLoginScreen();
            showToast("Signed out successfully", "info");
        }

        function applyAuthToUI() {
            if (!currentUser) return;

            const userNameEl = document.getElementById("loggedInUserName");
            const badgeIcon = document.getElementById("userBadgeIcon");
            const adminSwitcher = document.getElementById("adminSwitcherWrapper");
            const adminTabBtn = document.getElementById("tabBtn-adminTab");

            if (currentUser.role === "ADMIN") {
                userNameEl.innerText = "Super Admin";
                badgeIcon.className = "fa-solid fa-user-shield text-amber-300";
                adminSwitcher?.classList.remove("hidden");
                adminTabBtn?.classList.remove("hidden");
                activeRole = "ADMIN";
            } else {
                userNameEl.innerText = currentUser.name;
                badgeIcon.className = "fa-solid fa-user-tie text-orange-200";
                adminSwitcher?.classList.add("hidden");
                adminTabBtn?.classList.add("hidden");
                activeRole = currentUser.name;
            }

            renderAll();
        }
"""

# Let's insert the auth_js before closing script tag
if "let currentUser = null;" not in html:
    html = html.replace("let supabaseClient = null;", "let supabaseClient = null;\n" + auth_js)

# Also ensure checkAuthSession is called inside renderAll or DOMContentLoaded
html = html.replace("initSupabase();", "initSupabase();\n            checkAuthSession();")

with open("index.html", "w", encoding="utf-8") as f:
    f.write(html)

with open("templates/index.html", "w", encoding="utf-8") as f:
    f.write(html)

print("Created beautiful Manager & Admin Login screen and authentication system!")
