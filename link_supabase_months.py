import re

with open("index.html", "r", encoding="utf-8") as f:
    html = f.read()

# Enhance loadDatabaseData to also fetch monthly_cycles in parallel
old_fetch_block = """                // Fetch tables using flat parallel queries (immune to PostgREST schema cache issues)
                const [banksRes, managersRes, partnersRes, issuancesRes] = await Promise.all([
                    supabaseClient.from("banks").select("*").order("display_order"),
                    supabaseClient.from("managers").select("*").order("name"),
                    supabaseClient.from("channel_partners").select("*").order("name"),
                    supabaseClient.from("card_issuances").select("*").eq("month_year", currentActiveMonth)
                ]);"""

new_fetch_block = """                // Fetch tables using flat parallel queries (immune to PostgREST schema cache issues)
                const [banksRes, managersRes, partnersRes, issuancesRes, monthsRes] = await Promise.all([
                    supabaseClient.from("banks").select("*").order("display_order"),
                    supabaseClient.from("managers").select("*").order("name"),
                    supabaseClient.from("channel_partners").select("*").order("name"),
                    supabaseClient.from("card_issuances").select("*").eq("month_year", currentActiveMonth),
                    supabaseClient.from("monthly_cycles").select("*").order("code", { ascending: false })
                ]);

                // Sync available months from Supabase if table exists
                if (monthsRes && monthsRes.data && monthsRes.data.length > 0) {
                    availableMonths = monthsRes.data.map(m => ({
                        code: m.code,
                        label: m.name,
                        isLocked: !!m.is_locked,
                        prevMonth: m.prev_month_code
                    }));
                    renderMonthDropdown();
                }"""

html = html.replace(old_fetch_block, new_fetch_block)

# Update handleCreateNewMonth to also insert into monthly_cycles in Supabase
old_save_month = """                    const { error } = await supabaseClient
                        .from('card_issuances')
                        .upsert(newMonthIssuances, { onConflict: 'partner_id,bank_id,month_year' });"""

new_save_month = """                    // 1. Save Month definition in Supabase
                    await supabaseClient.from('monthly_cycles').upsert({
                        code: monthCode,
                        name: monthLabel,
                        isLocked: false,
                        prev_month_code: prevMonthCode
                    });

                    // 2. Save Month issuance records
                    const { error } = await supabaseClient
                        .from('card_issuances')
                        .upsert(newMonthIssuances, { onConflict: 'partner_id,bank_id,month_year' });"""

html = html.replace(old_save_month, new_save_month)

# Update toggleMonthLock to update monthly_cycles table in Supabase
old_toggle_lock = """        function toggleMonthLock() {
            if (!currentUser || currentUser.role !== "ADMIN") return;
            const mObj = availableMonths.find(m => m.code === currentActiveMonth);
            if (mObj) {
                mObj.isLocked = !mObj.isLocked;
                isCurrentMonthLocked = mObj.isLocked;
                renderMonthDropdown();
                renderTable();
                showToast(`${mObj.label} is now ${mObj.isLocked ? 'Locked 🔒' : 'Unlocked for Editing 🔓'}`, "success");
            }
        }"""

new_toggle_lock = """        async function toggleMonthLock() {
            if (!currentUser || currentUser.role !== "ADMIN") return;
            const mObj = availableMonths.find(m => m.code === currentActiveMonth);
            if (mObj) {
                mObj.isLocked = !mObj.isLocked;
                isCurrentMonthLocked = mObj.isLocked;
                renderMonthDropdown();
                renderTable();

                if (supabaseClient) {
                    await supabaseClient.from('monthly_cycles').update({ is_locked: mObj.isLocked }).eq('code', mObj.code);
                }

                showToast(`${mObj.label} is now ${mObj.isLocked ? 'Locked 🔒' : 'Unlocked for Editing 🔓'}`, "success");
            }
        }"""

html = html.replace(old_toggle_lock, new_toggle_lock)

with open("index.html", "w", encoding="utf-8") as f:
    f.write(html)

with open("templates/index.html", "w", encoding="utf-8") as f:
    f.write(html)

print("Linked monthly_cycles table in Supabase with live sync and lock persistence!")
