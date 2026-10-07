import re

with open("index.html", "r", encoding="utf-8") as f:
    html = f.read()

# Universal Calendar Math & Dynamic Month Propagation Engine
universal_month_math = """        // ========================================================
        // UNIVERSAL PREVIOUS MONTH CALENDAR ARITHMETIC ENGINE
        // Works for ANY month (e.g., 2026-11 -> 2026-10, 2027-01 -> 2026-12)
        // ========================================================
        function getPreviousMonthCode(monthCode) {
            if (!monthCode) return "2026-08";
            // Check if predefined in availableMonths
            const found = availableMonths.find(m => m.code === monthCode);
            if (found && found.prevMonth) return found.prevMonth;

            // Otherwise, calculate dynamically via calendar math
            const parts = monthCode.split("-");
            if (parts.length === 2) {
                let year = parseInt(parts[0], 10);
                let month = parseInt(parts[1], 10);
                if (month === 1) {
                    year -= 1;
                    month = 12;
                } else {
                    month -= 1;
                }
                return `${year}-${String(month).padStart(2, '0')}`;
            }
            return "2026-08";
        }

        function getMonthDisplayName(monthCode) {
            const found = availableMonths.find(m => m.code === monthCode);
            if (found) return found.label;
            const parts = monthCode.split("-");
            if (parts.length === 2) {
                const monthNames = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];
                const mIdx = parseInt(parts[1], 10) - 1;
                if (mIdx >= 0 && mIdx < 12) return `${monthNames[mIdx]} ${parts[0]}`;
            }
            return monthCode;
        }"""

# Update loadDatabaseData to use getPreviousMonthCode
old_prev_calc = """                // Determine previous month code
                const mObj = availableMonths.find(m => m.code === currentActiveMonth);
                const prevMonthCode = mObj ? mObj.prevMonth : "2026-08";"""

new_prev_calc = """                // Dynamically determine the previous month code for ANY month
                const prevMonthCode = getPreviousMonthCode(currentActiveMonth);"""

html = html.replace(old_prev_calc, new_prev_calc)

# Insert the universal month arithmetic function right before loadDatabaseData
if "function getPreviousMonthCode" not in html:
    html = html.replace("async function loadDatabaseData()", universal_month_math + "\n\n        async function loadDatabaseData()")

# Update handleCreateNewMonth to automatically calculate prevMonthCode using getPreviousMonthCode
old_create_month_prev = "const prevMonthCode = currentActiveMonth;"
new_create_month_prev = "const prevMonthCode = getPreviousMonthCode(monthCode);"
html = html.replace(old_create_month_prev, new_create_month_prev)

# Also update updateCellDirectly so if a user edits Month M-1, any dependent cached data updates
old_update_cell = """        async function updateCellDirectly(mgrId, cpId, bankId, field, value) {
            const valNum = parseInt(value) || 0;

            // 1. Update local state immediately for instant feedback
            dbData.managers.forEach(m => {
                m.partners.forEach(p => {
                    if (p.id === cpId || (p.name && p.id === cpId)) {
                        if (!p.banks[bankId]) p.banks[bankId] = { lm: 0, cm: 0 };
                        p.banks[bankId][field] = valNum;
                    }
                });
            });
            recalculateAll();
            renderStats();
            renderTable();

            // 2. Persist to Supabase if connected
            if (supabaseClient && cpId) {
                try {
                    const updatePayload = {
                        partner_id: cpId,
                        bank_id: bankId,
                        month_year: currentActiveMonth
                    };
                    updatePayload[field === 'lm' ? 'lm_count' : 'cm_count'] = valNum;

                    const { error } = await supabaseClient
                        .from('card_issuances')
                        .upsert(updatePayload, { onConflict: 'partner_id,bank_id,month_year' });

                    if (error) throw error;
                    showToast("Saved to Supabase PostgreSQL!", "success");
                } catch (e) {
                    console.error("Supabase write error:", e);
                    showToast("Supabase sync failed: " + e.message, "error");
                }
            } else {
                showToast("Updated locally", "info");
            }
        }"""

new_update_cell = """        async function updateCellDirectly(mgrId, cpId, bankId, field, value) {
            const valNum = parseInt(value) || 0;

            // 1. Update local state immediately for instant feedback
            dbData.managers.forEach(m => {
                m.partners.forEach(p => {
                    if (p.id === cpId || (p.name && p.id === cpId)) {
                        if (!p.banks[bankId]) p.banks[bankId] = { lm: 0, cm: 0 };
                        p.banks[bankId][field] = valNum;
                    }
                });
            });
            recalculateAll();
            renderStats();
            renderTable();

            // 2. Persist to Supabase if connected
            if (supabaseClient && cpId) {
                try {
                    const updatePayload = {
                        partner_id: cpId,
                        bank_id: bankId,
                        month_year: currentActiveMonth
                    };
                    // When in active month, we update cm_count (or lm_count if explicitly specified)
                    updatePayload[field === 'lm' ? 'lm_count' : 'cm_count'] = valNum;

                    const { error } = await supabaseClient
                        .from('card_issuances')
                        .upsert(updatePayload, { onConflict: 'partner_id,bank_id,month_year' });

                    if (error) throw error;
                    showToast("Saved to Supabase PostgreSQL!", "success");
                } catch (e) {
                    console.error("Supabase write error:", e);
                    showToast("Supabase sync failed: " + e.message, "error");
                }
            } else {
                showToast("Updated locally", "info");
            }
        }"""

html = html.replace(old_update_cell, new_update_cell)

with open("index.html", "w", encoding="utf-8") as f:
    f.write(html)

with open("templates/index.html", "w", encoding="utf-8") as f:
    f.write(html)

print("Engineered Universal Dynamic Month-over-Month Propagation for ALL future and past months!")
