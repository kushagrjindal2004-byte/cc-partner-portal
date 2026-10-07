with open("index.html", "r", encoding="utf-8") as f:
    html = f.read()

# Toolbar Month Selector & New Month Button
prominent_month_toolbar = """        <!-- Navigation Tabs & Month Controls Bar -->
        <div class="flex flex-wrap items-center justify-between border-b border-slate-200 bg-white px-4 py-2.5 rounded-xl shadow-sm gap-3">
            <nav class="flex space-x-2">
                <button onclick="switchTab('sheetTab')" id="tabBtn-sheetTab" class="tab-btn px-4 py-2 text-xs font-bold rounded-lg bg-orange-500 text-white shadow-sm flex items-center gap-2">
                    <i class="fa-solid fa-table-cells"></i>
                    <span>Master Sheet</span>
                </button>
                <button onclick="switchTab('insightsTab')" id="tabBtn-insightsTab" class="tab-btn px-4 py-2 text-xs font-semibold text-slate-600 hover:text-slate-900 hover:bg-slate-100 rounded-lg flex items-center gap-2">
                    <i class="fa-solid fa-chart-line text-orange-500"></i>
                    <span>Insights & Timeline</span>
                </button>
                <button onclick="switchTab('adminTab')" id="tabBtn-adminTab" class="tab-btn px-4 py-2 text-xs font-semibold text-slate-600 hover:text-slate-900 hover:bg-slate-100 rounded-lg flex items-center gap-2">
                    <i class="fa-solid fa-sliders text-blue-600"></i>
                    <span>Manage Data</span>
                </button>
            </nav>

            <!-- PROMINENT MONTH CYCLE SELECTOR & NEW MONTH BUTTON -->
            <div class="flex items-center bg-slate-900 text-white rounded-xl px-3 py-1.5 shadow-sm border border-slate-700 gap-2">
                <i class="fa-regular fa-calendar-days text-orange-400 text-sm"></i>
                <label class="text-xs text-slate-300 font-bold">Month Cycle:</label>
                <select id="monthSelector" onchange="handleMonthChange(this.value)" class="bg-slate-800 text-amber-300 font-bold text-xs rounded-lg px-2.5 py-1 border border-slate-600 focus:ring-2 focus:ring-orange-500 outline-none cursor-pointer">
                    <option value="2026-09" selected>🗓️ September 2026 (Active)</option>
                    <option value="2026-10">🗓️ October 2026</option>
                    <option value="2026-08">🔒 August 2026 (Locked)</option>
                </select>
                <button id="adminNewMonthBtn" onclick="openNewMonthModal()" title="Start New Month Cycle / Roll Forward" class="bg-gradient-to-r from-orange-500 to-amber-500 hover:from-orange-600 hover:to-amber-600 text-white px-3 py-1 rounded-lg text-xs font-bold transition flex items-center gap-1.5 shadow-md">
                    <i class="fa-solid fa-circle-plus text-xs"></i>
                    <span>+ New Month</span>
                </button>
            </div>

            <!-- Search & Filter -->
            <div class="flex items-center gap-2">
                <div class="relative">
                    <i class="fa-solid fa-magnifying-glass absolute left-3 top-1/2 -translate-y-1/2 text-slate-400 text-xs"></i>
                    <input type="text" id="searchInput" oninput="filterTable()" placeholder="Search CP or Bank..." class="pl-8 pr-3 py-1.5 text-xs bg-slate-100 border border-slate-300 rounded-lg focus:bg-white focus:outline-none focus:ring-2 focus:ring-orange-500 w-48">
                </div>
                <button onclick="openAddCPModal()" class="bg-orange-600 hover:bg-orange-700 text-white px-3 py-1.5 rounded-lg text-xs font-semibold shadow-sm transition flex items-center gap-1.5">
                    <i class="fa-solid fa-user-plus"></i>
                    <span>+ Add CP</span>
                </button>
            </div>
        </div>"""

old_nav_block = """        <!-- Navigation Tabs -->
        <div class="flex items-center justify-between border-b border-slate-200 bg-white px-4 py-2 rounded-xl shadow-sm">
            <nav class="flex space-x-2">
                <button onclick="switchTab('sheetTab')" id="tabBtn-sheetTab" class="tab-btn px-4 py-2 text-xs font-bold rounded-lg bg-orange-500 text-white shadow-sm flex items-center gap-2">
                    <i class="fa-solid fa-table-cells"></i>
                    <span>Master Sheet</span>
                </button>
                <button onclick="switchTab('insightsTab')" id="tabBtn-insightsTab" class="tab-btn px-4 py-2 text-xs font-semibold text-slate-600 hover:text-slate-900 hover:bg-slate-100 rounded-lg flex items-center gap-2">
                    <i class="fa-solid fa-chart-line text-orange-500"></i>
                    <span>Insights & Timeline</span>
                </button>
                <button onclick="switchTab('adminTab')" id="tabBtn-adminTab" class="tab-btn px-4 py-2 text-xs font-semibold text-slate-600 hover:text-slate-900 hover:bg-slate-100 rounded-lg flex items-center gap-2">
                    <i class="fa-solid fa-sliders text-blue-600"></i>
                    <span>Manage Data</span>
                </button>
            </nav>

            <!-- Search & Filter -->
            <div class="flex items-center gap-2">
                <div class="relative">
                    <i class="fa-solid fa-magnifying-glass absolute left-3 top-1/2 -translate-y-1/2 text-slate-400 text-xs"></i>
                    <input type="text" id="searchInput" oninput="filterTable()" placeholder="Search CP or Bank..." class="pl-8 pr-3 py-1.5 text-xs bg-slate-100 border border-slate-300 rounded-lg focus:bg-white focus:outline-none focus:ring-2 focus:ring-orange-500 w-48">
                </div>
                <button onclick="openAddCPModal()" class="bg-orange-600 hover:bg-orange-700 text-white px-3 py-1.5 rounded-lg text-xs font-semibold shadow-sm transition flex items-center gap-1.5">
                    <i class="fa-solid fa-user-plus"></i>
                    <span>+ Add CP</span>
                </button>
            </div>
        </div>"""

if old_nav_block in html:
    html = html.replace(old_nav_block, prominent_month_toolbar)

# Make sure renderMonthDropdown is called on init
if "renderMonthDropdown();" not in html:
    html = html.replace("renderAll();", "renderAll();\n            renderMonthDropdown();")

with open("index.html", "w", encoding="utf-8") as f:
    f.write(html)

with open("templates/index.html", "w", encoding="utf-8") as f:
    f.write(html)

print("Placed prominent Month Cycle Selector and '+ New Month' button in main toolbar!")
