with open("index.html", "r", encoding="utf-8") as f:
    html = f.read()

# 1. Pre-fill default options in HTML markup so it is NEVER blank
default_options = """                    <select id="loginManagerSelect" required class="w-full text-xs font-semibold p-3 bg-slate-50 border border-slate-200 rounded-xl focus:ring-2 focus:ring-orange-500 focus:bg-white outline-none transition">
                        <option value="AZAM">Manager: AZAM (5 CPs)</option>
                        <option value="BHAVANI">Manager: BHAVANI (26 CPs)</option>
                        <option value="BINOD MISHRA">Manager: BINOD MISHRA (13 CPs)</option>
                        <option value="DIVYAM">Manager: DIVYAM (15 CPs)</option>
                        <option value="VINAY PANDEY" selected>Manager: VINAY PANDEY (42 CPs)</option>
                        <option value="ALKESH SHUKLA">Manager: ALKESH SHUKLA (7 CPs)</option>
                        <option value="ZEESHAN HAIDER">Manager: ZEESHAN HAIDER (15 CPs)</option>
                        <option value="INAYA">Manager: INAYA (4 CPs)</option>
                    </select>"""

old_select_markup = """                    <select id="loginManagerSelect" required class="w-full text-xs font-semibold p-3 bg-slate-50 border border-slate-200 rounded-xl focus:ring-2 focus:ring-orange-500 focus:bg-white outline-none transition">
                        <!-- Populated dynamically with managers -->
                    </select>"""

if old_select_markup in html:
    html = html.replace(old_select_markup, default_options)

# 2. Update populateLoginManagerDropdown to be robust and called whenever data loads
old_populate_func = """        function populateLoginManagerDropdown() {
            const select = document.getElementById("loginManagerSelect");
            if (!select || !dbData.managers) return;
            select.innerHTML = dbData.managers.map(m => `
                <option value="${m.manager_name}">Manager: ${m.manager_name} (${m.partners?.length || 0} CPs)</option>
            `).join("");
        }"""

new_populate_func = """        function populateLoginManagerDropdown() {
            const select = document.getElementById("loginManagerSelect");
            if (!select) return;
            if (dbData && dbData.managers && dbData.managers.length > 0) {
                const currentVal = select.value;
                select.innerHTML = dbData.managers.map(m => `
                    <option value="${m.manager_name}">Manager: ${m.manager_name} (${m.partners?.length || 0} CPs)</option>
                `).join("");
                if (currentVal) select.value = currentVal;
            }
        }"""

html = html.replace(old_populate_func, new_populate_func)

# Also ensure populateLoginManagerDropdown is called inside renderAll
if "populateLoginManagerDropdown();" not in html:
    html = html.replace("renderRoleDropdown();", "renderRoleDropdown();\n            populateLoginManagerDropdown();")

with open("index.html", "w", encoding="utf-8") as f:
    f.write(html)

with open("templates/index.html", "w", encoding="utf-8") as f:
    f.write(html)

print("Fixed Manager Login Dropdown pre-population!")
