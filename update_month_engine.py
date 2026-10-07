import json
import re

with open("index.html", "r", encoding="utf-8") as f:
    html = f.read()

# Let's inspect and construct the month management logic
month_script = """
        // ==========================================
        // DYNAMIC MONTH-WISE MANAGEMENT ENGINE
        // ==========================================
        let currentActiveMonth = "2026-09";
        let availableMonths = [
            { code: "2026-10", label: "October 2026", isLocked: false, prevMonth: "2026-09" },
            { code: "2026-09", label: "September 2026", isLocked: false, prevMonth: "2026-08" },
            { code: "2026-08", label: "August 2026", isLocked: true, prevMonth: "2026-07" }
        ];
        let isCurrentMonthLocked = false;

        function renderMonthDropdown() {
            const select = document.getElementById("monthSelector");
            if (!select) return;
            select.innerHTML = availableMonths.map(m => `
                <option value="${m.code}" ${m.code === currentActiveMonth ? 'selected' : ''}>
                    ${m.isLocked ? '🔒 ' : '🗓️ '}${m.label} ${m.code === '2026-09' ? '(Active Data)' : ''}
                </option>
            `).join("");

            updateMonthLockBanner();
        }

        function handleMonthChange(monthCode) {
            currentActiveMonth = monthCode;
            const mObj = availableMonths.find(m => m.code === monthCode);
            isCurrentMonthLocked = mObj ? mObj.isLocked : false;
            updateMonthLockBanner();
            loadDatabaseData();
            showToast(`Switched to ${mObj ? mObj.label : monthCode}`, "info");
        }

        function updateMonthLockBanner() {
            const banner = document.getElementById("monthLockBanner");
            const lockStatusText = document.getElementById("lockStatusText");
            const unlockBtn = document.getElementById("unlockMonthBtn");
            const mObj = availableMonths.find(m => m.code === currentActiveMonth);

            if (!banner) return;

            if (mObj && mObj.isLocked) {
                banner.classList.remove("hidden");
                lockStatusText.innerText = `${mObj.label} is finalized and locked (Read-Only).`;
                if (currentUser && currentUser.role === "ADMIN") {
                    unlockBtn.classList.remove("hidden");
                } else {
                    unlockBtn.classList.add("hidden");
                }
            } else {
                banner.classList.add("hidden");
            }
        }

        function toggleMonthLock() {
            if (!currentUser || currentUser.role !== "ADMIN") return;
            const mObj = availableMonths.find(m => m.code === currentActiveMonth);
            if (mObj) {
                mObj.isLocked = !mObj.isLocked;
                isCurrentMonthLocked = mObj.isLocked;
                renderMonthDropdown();
                renderTable();
                showToast(`${mObj.label} is now ${mObj.isLocked ? 'Locked 🔒' : 'Unlocked for Editing 🔓'}`, "success");
            }
        }

        function openNewMonthModal() {
            if (!currentUser || currentUser.role !== "ADMIN") {
                showToast("Only Admin can create new monthly cycles", "error");
                return;
            }
            document.getElementById("newMonthModal").classList.remove("hidden");
        }
        function closeNewMonthModal() {
            document.getElementById("newMonthModal").classList.add("hidden");
        }

        async function handleCreateNewMonth(e) {
            e.preventDefault();
            const monthCode = document.getElementById("newMonthCode").value.trim();
            const monthLabel = document.getElementById("newMonthLabel").value.trim();

            if (!monthCode || !monthLabel) return;

            // Check if month already exists
            if (availableMonths.find(m => m.code === monthCode)) {
                showToast(`Month cycle ${monthCode} already exists!`, "error");
                return;
            }

            // Create new month object
            const prevMonthCode = currentActiveMonth;
            const newMonthObj = {
                code: monthCode,
                label: monthLabel,
                isLocked: false,
                prevMonth: prevMonthCode
            };

            availableMonths.unshift(newMonthObj);

            // Carry over all CPs: new LM = previous CM, and new CM = 0
            const newMonthIssuances = [];
            dbData.managers.forEach(m => {
                m.partners.forEach(p => {
                    dbData.banks.forEach(b => {
                        const prevCM = p.banks?.[b.id]?.cm || 0;
                        p.banks[b.id] = { lm: prevCM, cm: 0 };
                        if (p.id && b.id) {
                            newMonthIssuances.push({
                                partner_id: p.id,
                                bank_id: b.id,
                                month_year: monthCode,
                                lm_count: prevCM,
                                cm_count: 0
                            });
                        }
                    });
                });
            });

            currentActiveMonth = monthCode;
            isCurrentMonthLocked = false;
            renderMonthDropdown();
            recalculateAll();
            renderAll();
            closeNewMonthModal();

            // Persist to Supabase
            if (supabaseClient && newMonthIssuances.length > 0) {
                try {
                    const { error } = await supabaseClient
                        .from('card_issuances')
                        .upsert(newMonthIssuances, { onConflict: 'partner_id,bank_id,month_year' });
                    if (error) throw error;
                    showToast(`Created & initialized ${monthLabel} in Supabase!`, "success");
                } catch (err) {
                    console.error("Supabase new month error:", err);
                    showToast(`Created ${monthLabel} locally`, "info");
                }
            } else {
                showToast(`Created & initialized ${monthLabel}!`, "success");
            }
        }
"""

# Let's replace the month script section
old_month_pattern = r"let currentActiveMonth = \"2026-09\";[\s\S]*?function closeNewMonthModal\(\)\s*\{[\s\S]*?\}"
html = re.sub(old_month_pattern, month_script, html)

# Add Month Lock Alert Banner right above the spreadsheet
month_lock_banner_html = """
            <!-- Historical Month Locked Alert Banner -->
            <div id="monthLockBanner" class="hidden bg-slate-800 text-white rounded-xl p-3 px-4 flex items-center justify-between text-xs shadow-sm border border-slate-700">
                <div class="flex items-center gap-2">
                    <i class="fa-solid fa-lock text-amber-400 text-sm"></i>
                    <span id="lockStatusText" class="font-medium">This month cycle is finalized and locked (Read-Only).</span>
                </div>
                <button id="unlockMonthBtn" onclick="toggleMonthLock()" class="bg-amber-500 hover:bg-amber-600 text-slate-900 font-bold px-3 py-1 rounded-lg text-xs transition flex items-center gap-1">
                    <i class="fa-solid fa-lock-open"></i>
                    <span>Unlock Month for Editing (Admin)</span>
                </button>
            </div>
"""

if '<div id="monthLockBanner"' not in html:
    html = html.replace('<div id="sheetTab" class="tab-content space-y-3">', '<div id="sheetTab" class="tab-content space-y-3">\n' + month_lock_banner_html)

# Update input disabled state based on isCurrentMonthLocked
old_input_render = """<input type="number" min="0" value="${cmVal}"
                                        onchange="updateCellDirectly('${mgr.id}', '${p.id}', '${b.id}', 'cm', this.value)"
                                        class="editable-input w-14 text-right px-1 py-0.5 rounded border border-transparent hover:border-slate-300 text-slate-900 font-bold">"""

new_input_render = """<input type="number" min="0" value="${cmVal}" ${isCurrentMonthLocked ? 'disabled' : ''}
                                        onchange="updateCellDirectly('${mgr.id}', '${p.id}', '${b.id}', 'cm', this.value)"
                                        class="editable-input w-14 text-right px-1 py-0.5 rounded border border-transparent hover:border-slate-300 text-slate-900 font-bold ${isCurrentMonthLocked ? 'bg-slate-100 text-slate-500 cursor-not-allowed' : ''}">"""

html = html.replace(old_input_render, new_input_render)

with open("index.html", "w", encoding="utf-8") as f:
    f.write(html)

with open("templates/index.html", "w", encoding="utf-8") as f:
    f.write(html)

print("Implemented dynamic month-wise architecture, relative LM propagation, lock/unlock system, and Admin creation!")
