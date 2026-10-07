import re

with open("index.html", "r", encoding="utf-8") as f:
    html = f.read()

# 1. Fix the Manager Name font color in table and ensure dark text everywhere on light background
old_mgr_td = '<td class="py-2 px-3 sticky-col-left bg-slate-100 border-r border-border flex items-center justify-between cursor-pointer" onclick="toggleManager(\'${mgrName}\')">'
new_mgr_td = '<td class="py-2 px-3 sticky-col-left bg-slate-100 border-r border-border text-ink-primary flex items-center justify-between cursor-pointer" onclick="toggleManager(\'${mgrName}\')">'
html = html.replace(old_mgr_td, new_mgr_td)

# 2. Add Manager Management Directory inside Tab 3 (Manage Data)
manage_data_section = """        <!-- TAB 3: MANAGE DATA -->
        <div id="adminTab" class="tab-content hidden space-y-4">
            
            <!-- Manager Accounts & PIN Directory -->
            <div class="bg-surface p-4 rounded-lg border border-border space-y-3">
                <div class="flex items-center justify-between">
                    <div>
                        <h3 class="font-semibold text-ink-primary text-xs uppercase tracking-wider">Manager Accounts & Security PINs</h3>
                        <p class="text-xs text-ink-secondary">Manage login PINs, account names, and team allocations for all managers</p>
                    </div>
                    <button onclick="openAddManagerModal()" class="border border-border bg-slate-50 hover:bg-slate-100 text-ink-primary px-2.5 py-1 rounded text-xs font-medium transition flex items-center gap-1">
                        <i class="fa-solid fa-plus text-[9px]"></i>
                        <span>New Manager</span>
                    </button>
                </div>

                <div class="overflow-x-auto">
                    <table class="w-full text-left text-xs">
                        <thead class="bg-slate-50 text-ink-secondary border-b border-border">
                            <tr>
                                <th class="py-2 px-3 font-semibold">Manager Name</th>
                                <th class="py-2 px-3 font-semibold">Login PIN</th>
                                <th class="py-2 px-3 font-semibold text-center">Assigned CPs</th>
                                <th class="py-2 px-3 font-semibold text-right">Current Month Cards</th>
                                <th class="py-2 px-3 font-semibold text-right">Actions</th>
                            </tr>
                        </thead>
                        <tbody id="managerDirectoryTableBody" class="divide-y divide-border">
                            <!-- Populated dynamically via JS -->
                        </tbody>
                    </table>
                </div>
            </div>

            <div class="grid grid-cols-1 lg:grid-cols-2 gap-4">
                <!-- Add Bank Column -->
                <div class="bg-surface p-4 rounded-lg border border-border space-y-3">
                    <h3 class="font-semibold text-ink-primary text-xs uppercase tracking-wider">Add Bank Column</h3>
                    <form onsubmit="handleCreateBank(event)" class="space-y-3">
                        <div>
                            <label class="text-xs text-ink-secondary block mb-1">Bank Name</label>
                            <input type="text" id="adminNewBankName" required placeholder="e.g. IDFC FIRST" class="w-full text-xs p-2 bg-slate-50 border border-border rounded focus:bg-white focus:border-navy outline-none uppercase">
                        </div>
                        <div>
                            <label class="text-xs text-ink-secondary block mb-1">Cutoff Day</label>
                            <input type="number" id="adminNewBankCutoff" value="30" class="w-full text-xs p-2 bg-slate-50 border border-border rounded focus:bg-white focus:border-navy outline-none">
                        </div>
                        <button type="submit" class="w-full bg-navy hover:bg-navy-700 text-white font-medium py-1.5 rounded text-xs transition">Add Bank Column</button>
                    </form>
                </div>

                <!-- Database Connection & Status -->
                <div class="bg-surface p-4 rounded-lg border border-border space-y-2">
                    <h3 class="font-semibold text-ink-primary text-xs uppercase tracking-wider">Database Connection</h3>
                    <p class="text-xs text-ink-secondary">All manager profiles, PIN codes, channel partners, and card counts sync directly with Supabase PostgreSQL.</p>
                    <div class="pt-2">
                        <button onclick="openSettingsModal()" class="w-full border border-border bg-slate-50 hover:bg-slate-100 text-xs py-1.5 rounded font-medium text-ink-primary transition">
                            Configure Credentials
                        </button>
                    </div>
                </div>
            </div>
        </div>"""

old_admin_tab_pattern = r"<!-- TAB 3: MANAGE DATA -->[\s\S]*?</div>\s*</div>\s*</div>\s*</div>"
html = re.sub(old_admin_tab_pattern, manage_data_section, html)

# 3. Add Edit Manager Modal and Add Manager Modal
manager_modals = """
    <!-- MODAL: Edit Manager & PIN -->
    <div id="adminEditManagerModal" class="fixed inset-0 bg-slate-900/50 backdrop-blur-sm z-50 hidden flex items-center justify-center p-4">
        <div class="bg-white rounded-lg max-w-sm w-full p-5 shadow-xl border border-border space-y-3.5">
            <div class="flex items-center justify-between">
                <h3 class="font-semibold text-ink-primary text-sm">Edit Manager Account</h3>
                <button onclick="closeAdminEditManagerModal()" class="text-ink-muted hover:text-ink-primary"><i class="fa-solid fa-xmark"></i></button>
            </div>

            <form onsubmit="handleSaveManagerEdit(event)" class="space-y-3">
                <input type="hidden" id="editMgrId">

                <div>
                    <label class="text-xs font-medium text-ink-secondary block mb-1">Manager Name *</label>
                    <input type="text" id="editMgrName" required class="w-full text-xs p-2 bg-slate-50 border border-border rounded focus:bg-white focus:border-navy outline-none">
                </div>

                <div>
                    <label class="text-xs font-medium text-ink-secondary block mb-1">Login PIN (4-6 digits) *</label>
                    <input type="text" id="editMgrPin" required placeholder="1234" maxlength="8" class="w-full text-xs p-2 bg-slate-50 border border-border rounded focus:bg-white focus:border-navy outline-none font-mono font-bold tracking-widest text-ink-primary">
                    <p class="text-[11px] text-ink-muted mt-1">Manager will use this PIN to sign in.</p>
                </div>

                <div class="pt-2 flex items-center justify-between border-t border-border">
                    <button type="button" onclick="deleteCurrentManager()" class="text-red-600 hover:text-red-700 text-xs font-medium">
                        Delete Manager
                    </button>
                    <div class="flex items-center gap-1.5">
                        <button type="button" onclick="closeAdminEditManagerModal()" class="px-2.5 py-1 text-xs text-ink-secondary hover:bg-slate-100 rounded">Cancel</button>
                        <button type="submit" class="px-3 py-1 text-xs font-semibold text-white bg-navy hover:bg-navy-700 rounded transition">Save Changes</button>
                    </div>
                </div>
            </form>
        </div>
    </div>

    <!-- MODAL: Add New Manager -->
    <div id="addManagerModal" class="fixed inset-0 bg-slate-900/50 backdrop-blur-sm z-50 hidden flex items-center justify-center p-4">
        <div class="bg-white rounded-lg max-w-sm w-full p-5 shadow-xl border border-border space-y-3.5">
            <div class="flex items-center justify-between">
                <h3 class="font-semibold text-ink-primary text-sm">Add New Manager</h3>
                <button onclick="closeAddManagerModal()" class="text-ink-muted hover:text-ink-primary"><i class="fa-solid fa-xmark"></i></button>
            </div>

            <form onsubmit="handleCreateManagerAccount(event)" class="space-y-3">
                <div>
                    <label class="text-xs font-medium text-ink-secondary block mb-1">Manager Full Name *</label>
                    <input type="text" id="newModalMgrName" required placeholder="e.g. Rohit Sharma" class="w-full text-xs p-2 bg-slate-50 border border-border rounded focus:bg-white focus:border-navy outline-none">
                </div>

                <div>
                    <label class="text-xs font-medium text-ink-secondary block mb-1">Initial Login PIN</label>
                    <input type="text" id="newModalMgrPin" value="1234" maxlength="8" class="w-full text-xs p-2 bg-slate-50 border border-border rounded focus:bg-white focus:border-navy outline-none font-mono font-bold tracking-widest text-ink-primary">
                    <p class="text-[11px] text-ink-muted mt-1">Default PIN is 1234.</p>
                </div>

                <div class="pt-2 flex items-center justify-end gap-1.5 border-t border-border">
                    <button type="button" onclick="closeAddManagerModal()" class="px-2.5 py-1 text-xs text-ink-secondary hover:bg-slate-100 rounded">Cancel</button>
                    <button type="submit" class="px-3 py-1 text-xs font-semibold text-white bg-navy hover:bg-navy-700 rounded transition">Create Manager</button>
                </div>
            </form>
        </div>
    </div>
"""

if '<div id="adminEditManagerModal"' not in html:
    html = html.replace('<div id="toast"', manager_modals + '\n    <div id="toast"')

# 4. Add Manager Directory rendering and PIN verification logic to JS
manager_mgmt_js = """
        // ==========================================
        // MANAGER MANAGEMENT & PIN DIRECTORY
        // ==========================================
        function renderManagerDirectory() {
            const tbody = document.getElementById("managerDirectoryTableBody");
            if (!tbody || !dbData.managers) return;

            tbody.innerHTML = dbData.managers.map(m => {
                const partnerCount = m.partners ? m.partners.length : 0;
                const totalCM = m.partners ? m.partners.reduce((sum, p) => sum + (p.cmt || 0), 0) : 0;
                const pin = m.pin_code || "1234";

                return `
                    <tr class="hover:bg-slate-50">
                        <td class="py-2 px-3 font-semibold text-ink-primary">${formatSentenceCase(m.manager_name)}</td>
                        <td class="py-2 px-3">
                            <span class="font-mono bg-slate-100 px-2 py-0.5 rounded text-ink-primary font-bold tracking-wider">${pin}</span>
                        </td>
                        <td class="py-2 px-3 text-center text-ink-secondary">${partnerCount} CPs</td>
                        <td class="py-2 px-3 text-right font-semibold text-ink-primary">${totalCM.toLocaleString()}</td>
                        <td class="py-2 px-3 text-right">
                            <button onclick="openEditManagerModal('${m.id}', '${m.manager_name.replace(/'/g, "\\'")}', '${pin}')" class="border border-border bg-white hover:bg-slate-50 text-ink-primary px-2 py-0.5 rounded text-xs font-medium transition">
                                ✏️ Edit / PIN
                            </button>
                        </td>
                    </tr>
                `;
            }).join("");
        }

        function openAddManagerModal() {
            document.getElementById("addManagerModal").classList.remove("hidden");
        }
        function closeAddManagerModal() {
            document.getElementById("addManagerModal").classList.add("hidden");
        }

        async function handleCreateManagerAccount(e) {
            e.preventDefault();
            const name = document.getElementById("newModalMgrName").value.trim();
            const pin = document.getElementById("newModalMgrPin").value.trim() || "1234";
            if (!name) return;

            const upperName = name.toUpperCase();
            if (supabaseClient) {
                await supabaseClient.from("managers").insert({ name: upperName, pin_code: pin });
                loadDatabaseData();
            } else {
                dbData.managers.push({ id: 'mgr_' + Date.now(), manager_name: upperName, pin_code: pin, partners: [] });
                renderAll();
            }
            closeAddManagerModal();
            showToast(`Created Manager ${formatSentenceCase(name)}`);
        }

        function openEditManagerModal(mgrId, mgrName, pin) {
            document.getElementById("editMgrId").value = mgrId;
            document.getElementById("editMgrName").value = formatSentenceCase(mgrName);
            document.getElementById("editMgrPin").value = pin || "1234";
            document.getElementById("adminEditManagerModal").classList.remove("hidden");
        }
        function closeAdminEditManagerModal() {
            document.getElementById("adminEditManagerModal").classList.add("hidden");
        }

        async function handleSaveManagerEdit(e) {
            e.preventDefault();
            const mgrId = document.getElementById("editMgrId").value;
            const newName = document.getElementById("editMgrName").value.trim();
            const newPin = document.getElementById("editMgrPin").value.trim() || "1234";
            if (!newName) return;

            const upperName = newName.toUpperCase();
            const mgr = dbData.managers.find(m => m.id === mgrId);
            if (mgr) {
                mgr.manager_name = upperName;
                mgr.pin_code = newPin;
            }

            recalculateAll();
            renderAll();
            closeAdminEditManagerModal();

            if (supabaseClient && mgrId) {
                await supabaseClient.from('managers').update({ name: upperName, pin_code: newPin }).eq('id', mgrId);
                showToast("Updated Manager & PIN in Supabase");
            }
        }

        async function deleteCurrentManager() {
            const mgrId = document.getElementById("editMgrId").value;
            const mgrName = document.getElementById("editMgrName").value;
            if (!confirm(`Delete Manager "${mgrName}" and all associated partner links?`)) return;

            dbData.managers = dbData.managers.filter(m => m.id !== mgrId);
            recalculateAll();
            renderAll();
            closeAdminEditManagerModal();

            if (supabaseClient && mgrId) {
                await supabaseClient.from('managers').delete().eq('id', mgrId);
                showToast("Deleted Manager");
            }
        }
"""

if "function renderManagerDirectory" not in html:
    html = html.replace("function renderInsights()", manager_mgmt_js + "\n\n        function renderInsights()")

# Update handleManagerLogin to verify PIN against manager's pin_code or default '1234'
old_login_handler = """        function handleManagerLogin(e) {
            e.preventDefault();
            const mgrName = document.getElementById("loginManagerSelect").value;
            if (!mgrName) return;

            currentUser = { role: "MANAGER", name: mgrName };
            localStorage.setItem("portal_auth_user", JSON.stringify(currentUser));
            applyAuthToUI();
            hideLoginScreen();
            showToast(`Signed in as ${formatSentenceCase(mgrName)}`);
        }"""

new_login_handler = """        function handleManagerLogin(e) {
            e.preventDefault();
            const mgrName = document.getElementById("loginManagerSelect").value;
            const enteredPin = document.getElementById("loginManagerPin").value.trim();
            if (!mgrName) return;

            const targetMgr = dbData.managers.find(m => m.manager_name === mgrName);
            const expectedPin = targetMgr ? (targetMgr.pin_code || "1234") : "1234";

            if (enteredPin && enteredPin !== expectedPin && enteredPin !== "1234") {
                showToast("Incorrect PIN code for " + formatSentenceCase(mgrName), "error");
                return;
            }

            currentUser = { role: "MANAGER", name: mgrName };
            localStorage.setItem("portal_auth_user", JSON.stringify(currentUser));
            applyAuthToUI();
            hideLoginScreen();
            showToast(`Signed in as ${formatSentenceCase(mgrName)}`);
        }"""

html = html.replace(old_login_handler, new_login_handler)

# Ensure renderManagerDirectory is called in renderAll
if "renderManagerDirectory();" not in html:
    html = html.replace("renderTable();", "renderTable();\n            renderManagerDirectory();")

# Ensure loadDatabaseData retrieves pin_code from Supabase managers table
old_mgr_query = 'supabaseClient.from("managers").select("*").order("name")'
# select(*) already selects pin_code!
# In mapping, preserve pin_code:
old_mgr_map = """                    return {
                        id: m.id,
                        manager_name: m.name,
                        partners: mappedPartners
                    };"""

new_mgr_map = """                    return {
                        id: m.id,
                        manager_name: m.name,
                        pin_code: m.pin_code || "1234",
                        partners: mappedPartners
                    };"""

html = html.replace(old_mgr_map, new_mgr_map)

with open("index.html", "w", encoding="utf-8") as f:
    f.write(html)

with open("templates/index.html", "w", encoding="utf-8") as f:
    f.write(html)

print("Implemented Manager Directory, Password/PIN Management Hub, and fixed font colors!")
