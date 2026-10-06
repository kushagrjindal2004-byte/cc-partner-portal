import re

with open("index.html", "r", encoding="utf-8") as f:
    code = f.read()

# Let's add Admin CP Editor Modal and Row Actions
admin_cp_modal = """
    <!-- MODAL: Admin Edit CP Details & Reassign Manager -->
    <div id="adminEditCPModal" class="fixed inset-0 bg-black/50 z-50 hidden flex items-center justify-center p-4">
        <div class="bg-white rounded-2xl max-w-md w-full p-6 shadow-2xl space-y-4">
            <div class="flex items-center justify-between">
                <h3 class="font-bold text-slate-800 text-base flex items-center gap-2">
                    <i class="fa-solid fa-pen-to-square text-orange-600"></i>
                    <span>Edit Channel Partner & Manager</span>
                </h3>
                <button onclick="closeAdminEditCPModal()" class="text-slate-400 hover:text-slate-600"><i class="fa-solid fa-xmark text-lg"></i></button>
            </div>

            <form onsubmit="handleSaveCPEdit(event)" class="space-y-3.5">
                <input type="hidden" id="editCpId">
                <input type="hidden" id="editOldManagerId">

                <div>
                    <label class="text-xs font-bold text-slate-700 block mb-1">Channel Partner Name *</label>
                    <input type="text" id="editCpName" required class="w-full text-xs font-semibold p-2.5 bg-slate-50 border border-slate-300 rounded-lg focus:ring-2 focus:ring-orange-500 uppercase">
                </div>

                <div>
                    <label class="text-xs font-bold text-slate-700 block mb-1">Assigned Manager (Reassign CP) *</label>
                    <select id="editCpManagerSelect" required class="w-full text-xs font-semibold p-2.5 bg-slate-50 border border-slate-300 rounded-lg focus:ring-2 focus:ring-orange-500">
                        <!-- Populated dynamically -->
                    </select>
                </div>

                <div>
                    <label class="text-xs font-bold text-slate-700 block mb-1">Working Capital Allocation (₹)</label>
                    <input type="number" id="editCpCapital" placeholder="0" class="w-full text-xs font-semibold p-2.5 bg-slate-50 border border-slate-300 rounded-lg focus:ring-2 focus:ring-orange-500">
                </div>

                <div class="pt-2 flex items-center justify-between">
                    <button type="button" onclick="deleteCurrentCP()" class="text-rose-600 hover:text-rose-800 text-xs font-bold flex items-center gap-1">
                        <i class="fa-regular fa-trash-can"></i> Delete CP
                    </button>
                    <div class="flex items-center gap-2">
                        <button type="button" onclick="closeAdminEditCPModal()" class="px-3.5 py-2 text-xs font-semibold text-slate-600 hover:bg-slate-100 rounded-lg">Cancel</button>
                        <button type="submit" class="px-4 py-2 text-xs font-bold text-white bg-orange-600 hover:bg-orange-700 rounded-lg shadow-sm">Save Changes</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
"""

# Insert admin_cp_modal before toast
if '<div id="adminEditCPModal"' not in code:
    code = code.replace('<div id="toast"', admin_cp_modal + '\n    <div id="toast"')

# Add JS functions for Admin Edit CP, Delete CP, Quick Add CP
admin_js = """
        function openEditCPModal(cpId, cpName, mgrId, capital) {
            document.getElementById("editCpId").value = cpId;
            document.getElementById("editOldManagerId").value = mgrId;
            document.getElementById("editCpName").value = cpName;
            document.getElementById("editCpCapital").value = capital || 0;

            const select = document.getElementById("editCpManagerSelect");
            select.innerHTML = dbData.managers.map(m => `
                <option value="${m.id}" ${m.id === mgrId ? 'selected' : ''}>${m.manager_name}</option>
            `).join("");

            document.getElementById("adminEditCPModal").classList.remove("hidden");
        }

        function closeAdminEditCPModal() {
            document.getElementById("adminEditCPModal").classList.add("hidden");
        }

        async function handleSaveCPEdit(e) {
            e.preventDefault();
            const cpId = document.getElementById("editCpId").value;
            const newName = document.getElementById("editCpName").value.trim();
            const newMgrId = document.getElementById("editCpManagerSelect").value;
            const capital = Number(document.getElementById("editCpCapital").value) || 0;

            // 1. Update local state
            let cpObj = null;
            dbData.managers.forEach(m => {
                const idx = m.partners.findIndex(p => p.id === cpId);
                if (idx !== -1) {
                    cpObj = m.partners.splice(idx, 1)[0];
                }
            });

            if (cpObj) {
                cpObj.name = newName;
                cpObj.working_capital = capital;
                const targetMgr = dbData.managers.find(m => m.id === newMgrId);
                if (targetMgr) targetMgr.partners.push(cpObj);
            }

            recalculateAll();
            renderAll();
            closeAdminEditCPModal();

            // 2. Persist to Supabase if connected
            if (supabaseClient && cpId) {
                try {
                    const { error } = await supabaseClient
                        .from('channel_partners')
                        .update({ name: newName, manager_id: newMgrId, working_capital: capital })
                        .eq('id', cpId);

                    if (error) throw error;
                    showToast(`Updated "${newName}" in Supabase!`, "success");
                } catch (err) {
                    console.error("Supabase update error:", err);
                    showToast("Error updating Supabase: " + err.message, "error");
                }
            } else {
                showToast(`Updated "${newName}" locally!`, "success");
            }
        }

        async function deleteCurrentCP() {
            const cpId = document.getElementById("editCpId").value;
            const cpName = document.getElementById("editCpName").value;

            if (!confirm(`Are you sure you want to permanently delete Channel Partner "${cpName}"?`)) return;

            // 1. Remove from local state
            dbData.managers.forEach(m => {
                m.partners = m.partners.filter(p => p.id !== cpId);
            });
            recalculateAll();
            renderAll();
            closeAdminEditCPModal();

            // 2. Delete in Supabase
            if (supabaseClient && cpId) {
                try {
                    const { error } = await supabaseClient
                        .from('channel_partners')
                        .delete()
                        .eq('id', cpId);
                    if (error) throw error;
                    showToast(`Deleted "${cpName}" from Supabase!`, "info");
                } catch (err) {
                    showToast("Delete error: " + err.message, "error");
                }
            } else {
                showToast(`Deleted "${cpName}"`, "info");
            }
        }

        function quickAddCP(mgrId, mgrName) {
            openAddCPModal();
            document.getElementById("modalAddCPManagerSelect").value = mgrName;
        }
"""

if "function openEditCPModal" not in code:
    code = code.replace("function openAddCPModal()", admin_js + "\n        function openAddCPModal()")

# Now let's update table rendering to add Admin edit icons on CP rows and Manager rows
old_table_partner_cell = """<td class="py-2 px-4 pl-8 sticky-col-1 bg-white group-hover:bg-orange-50/50 border-r border-slate-200 font-medium text-slate-800">${p.name}</td>"""

new_table_partner_cell = """<td class="py-2 px-4 pl-8 sticky-col-1 bg-white group-hover:bg-orange-50/50 border-r border-slate-200 font-medium text-slate-800 flex items-center justify-between">
                                    <span>${p.name}</span>
                                    <div class="opacity-0 group-hover:opacity-100 flex items-center gap-1 transition">
                                        <button onclick="openEditCPModal('${p.id}', '${p.name.replace(/'/g, "\\'")}', '${mgr.id}', ${p.working_capital || 0})" title="Edit CP Name, Manager or Capital" class="p-1 text-slate-400 hover:text-orange-600 rounded">
                                            <i class="fa-solid fa-pen text-[11px]"></i>
                                        </button>
                                    </div>
                                </td>"""

if old_table_partner_cell in code:
    code = code.replace(old_table_partner_cell, new_table_partner_cell)

# Also add quick Add CP button on the Manager header row
old_mgr_cell = """<div class="flex items-center gap-2">
                                <i class="fa-solid ${isCollapsed ? 'fa-chevron-right' : 'fa-chevron-down'} text-orange-700 text-xs"></i>
                                <span class="text-orange-950 uppercase tracking-wide">★ MANAGER: ${mgrName}</span>
                                <span class="text-[10px] bg-orange-600 text-white px-1.5 py-0.2 rounded-full">${partners.length} CPs</span>
                            </div>"""

new_mgr_cell = """<div class="flex items-center justify-between w-full pr-2">
                                <div class="flex items-center gap-2" onclick="toggleManager('${mgrName}')">
                                    <i class="fa-solid ${isCollapsed ? 'fa-chevron-right' : 'fa-chevron-down'} text-orange-700 text-xs"></i>
                                    <span class="text-orange-950 uppercase tracking-wide">★ MANAGER: ${mgrName}</span>
                                    <span class="text-[10px] bg-orange-600 text-white px-1.5 py-0.2 rounded-full font-bold">${partners.length} CPs</span>
                                </div>
                                <button onclick="event.stopPropagation(); quickAddCP('${mgr.id}', '${mgrName}')" title="Add CP under ${mgrName}" class="bg-orange-500/20 hover:bg-orange-600 text-orange-900 hover:text-white px-2 py-0.5 rounded text-[11px] font-bold transition flex items-center gap-1">
                                    <i class="fa-solid fa-plus text-[9px]"></i> Add CP
                                </button>
                            </div>"""

if old_mgr_cell in code:
    code = code.replace(old_mgr_cell, new_mgr_cell)

with open("index.html", "w", encoding="utf-8") as f:
    f.write(code)

with open("templates/index.html", "w", encoding="utf-8") as f:
    f.write(code)

print("Enhanced Admin live editing, CP reassignments, and Supabase real-time persistence!")
