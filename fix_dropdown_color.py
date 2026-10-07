with open("index.html", "r", encoding="utf-8") as f:
    html = f.read()

# 1. Add global select option CSS rule to force dark text on white dropdowns
css_fix = """        select option {
            background-color: #FFFFFF !important;
            color: #0F172A !important;
            font-weight: 500;
        }"""

if "select option {" not in html:
    html = html.replace(".table-th {", css_fix + "\n        .table-th {")

# 2. Update renderRoleDropdown to explicitly add text-slate-900 and bg-white to every option tag
old_role_render = """        function renderRoleDropdown() {
            const roleSelect = document.getElementById("userRoleSelect");
            const modalMgrSelect = document.getElementById("modalAddCPManagerSelect");
            let opts = `<option value="ADMIN">All Managers (Master)</option>`;
            let modalOpts = "";

            dbData.managers.forEach(m => {
                const selected = activeRole === m.manager_name ? "selected" : "";
                const formattedName = formatSentenceCase(m.manager_name);
                opts += `<option value="${m.manager_name}" ${selected}>${formattedName}</option>`;
                modalOpts += `<option value="${m.manager_name}">${formattedName}</option>`;
            });

            roleSelect.innerHTML = opts;
            if (modalMgrSelect) modalMgrSelect.innerHTML = modalOpts;
        }"""

new_role_render = """        function renderRoleDropdown() {
            const roleSelect = document.getElementById("userRoleSelect");
            const modalMgrSelect = document.getElementById("modalAddCPManagerSelect");
            let opts = `<option value="ADMIN" class="text-slate-900 bg-white">All Managers (Master)</option>`;
            let modalOpts = "";

            dbData.managers.forEach(m => {
                const selected = activeRole === m.manager_name ? "selected" : "";
                const formattedName = formatSentenceCase(m.manager_name);
                opts += `<option value="${m.manager_name}" ${selected} class="text-slate-900 bg-white">${formattedName}</option>`;
                modalOpts += `<option value="${m.manager_name}" class="text-slate-900 bg-white">${formattedName}</option>`;
            });

            roleSelect.innerHTML = opts;
            if (modalMgrSelect) modalMgrSelect.innerHTML = modalOpts;
        }"""

html = html.replace(old_role_render, new_role_render)

# 3. Also update the userRoleSelect element markup
old_select_markup = '<select id="userRoleSelect" onchange="handleRoleChange()" class="bg-transparent text-white text-xs font-medium outline-none cursor-pointer">'
new_select_markup = '<select id="userRoleSelect" onchange="handleRoleChange()" class="bg-transparent text-white text-xs font-medium outline-none cursor-pointer [&>option]:bg-white [&>option]:text-slate-900">'
html = html.replace(old_select_markup, new_select_markup)

with open("index.html", "w", encoding="utf-8") as f:
    f.write(html)

with open("templates/index.html", "w", encoding="utf-8") as f:
    f.write(html)

print("Fixed dropdown option text color in top navigation bar!")
