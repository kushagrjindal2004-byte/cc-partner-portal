import re

with open("index.html", "r", encoding="utf-8") as f:
    html = f.read()

# Dynamic Multi-Month Loading & Relative LM Computation
new_load_database_function = """        async function loadDatabaseData() {
            if (!supabaseClient) {
                loadLocalDataFallback();
                return;
            }
            try {
                // Determine previous month code
                const mObj = availableMonths.find(m => m.code === currentActiveMonth);
                const prevMonthCode = mObj ? mObj.prevMonth : "2026-08";

                // Fetch tables using flat parallel queries
                const [banksRes, managersRes, partnersRes, currIssuancesRes, prevIssuancesRes, monthsRes] = await Promise.all([
                    supabaseClient.from("banks").select("*").order("display_order"),
                    supabaseClient.from("managers").select("*").order("name"),
                    supabaseClient.from("channel_partners").select("*").order("name"),
                    supabaseClient.from("card_issuances").select("*").eq("month_year", currentActiveMonth),
                    supabaseClient.from("card_issuances").select("*").eq("month_year", prevMonthCode),
                    supabaseClient.from("monthly_cycles").select("*").order("code", { ascending: false })
                ]);

                if (banksRes.error || managersRes.error || partnersRes.error) {
                    const err = banksRes.error || managersRes.error || partnersRes.error;
                    console.error("Supabase load error:", err);
                    showToast("Supabase Error: " + err.message, "error");
                    loadLocalDataFallback();
                    return;
                }

                const banks = banksRes.data || [];
                const managers = managersRes.data || [];
                const partners = partnersRes.data || [];
                const currIssuances = currIssuancesRes.data || [];
                const prevIssuances = prevIssuancesRes.data || [];

                // Sync available months from Supabase if table exists
                if (monthsRes && monthsRes.data && monthsRes.data.length > 0) {
                    availableMonths = monthsRes.data.map(m => ({
                        code: m.code,
                        label: m.name,
                        isLocked: !!m.is_locked,
                        prevMonth: m.prev_month_code
                    }));
                    renderMonthDropdown();
                }

                // Build previous month CM lookup map: partner_id -> { bank_id: cm_count }
                const prevMonthMap = {};
                prevIssuances.forEach(ci => {
                    if (!prevMonthMap[ci.partner_id]) prevMonthMap[ci.partner_id] = {};
                    prevMonthMap[ci.partner_id][ci.bank_id] = ci.cm_count || 0;
                });

                // Build current month CM lookup map: partner_id -> { bank_id: { cm, lm, record_id } }
                const currMonthMap = {};
                currIssuances.forEach(ci => {
                    if (!currMonthMap[ci.partner_id]) currMonthMap[ci.partner_id] = {};
                    currMonthMap[ci.partner_id][ci.bank_id] = {
                        cm: ci.cm_count || 0,
                        lm: ci.lm_count || 0,
                        record_id: ci.id
                    };
                });

                // Assemble Managers and their Channel Partners
                dbData.banks = banks;
                dbData.managers = managers.map(m => {
                    const mappedPartners = partners.filter(p => p.manager_id === m.id).map(p => {
                        let bObj = {};
                        banks.forEach(b => {
                            // DYNAMIC RELATIVE LM:
                            // LM is ALWAYS derived from previous month's CM count!
                            const prevCM = prevMonthMap[p.id]?.[b.id] ?? (currMonthMap[p.id]?.[b.id]?.lm || 0);
                            const currentCM = currMonthMap[p.id]?.[b.id]?.cm || 0;
                            const recId = currMonthMap[p.id]?.[b.id]?.record_id || null;

                            bObj[b.id] = {
                                lm: prevCM,
                                cm: currentCM,
                                record_id: recId
                            };
                        });

                        return {
                            id: p.id,
                            name: p.name,
                            working_capital: p.working_capital || 0,
                            banks: bObj
                        };
                    });

                    return {
                        id: m.id,
                        manager_name: m.name,
                        partners: mappedPartners
                    };
                });

                recalculateAll();
                renderAll();
                updateStatus(true, "Supabase Connected");
            } catch (err) {
                console.error("Database connection exception:", err);
                loadLocalDataFallback();
            }
        }"""

# Also enhance loadLocalDataFallback to compute dynamic relative LM
new_fallback_function = """        async function loadLocalDataFallback() {
            try {
                const res = await fetch("/api/data");
                if (res.ok) {
                    const json = await res.json();
                    if (json.success) {
                        dbData = json.data;
                    }
                }
            } catch (e) {
                dbData = JSON.parse(JSON.stringify(EMBEDDED_FALLBACK_DATA));
            }

            if (!dbData || !dbData.managers) {
                dbData = JSON.parse(JSON.stringify(EMBEDDED_FALLBACK_DATA));
            }

            // If viewing October 2026 in local/demo mode:
            // LM is automatically set to September's CM values, and CM is set to 0!
            if (currentActiveMonth === "2026-10") {
                dbData.managers.forEach(m => {
                    m.partners.forEach(p => {
                        dbData.banks.forEach(b => {
                            const sepCM = p.banks?.[b.id]?.cm || 0;
                            p.banks[b.id] = {
                                lm: sepCM,
                                cm: 0
                            };
                        });
                    });
                });
            } else if (currentActiveMonth === "2026-08") {
                // August locked historical view
                dbData.managers.forEach(m => {
                    m.partners.forEach(p => {
                        dbData.banks.forEach(b => {
                            const augCount = p.banks?.[b.id]?.lm || 0;
                            p.banks[b.id] = {
                                lm: 0,
                                cm: augCount
                            };
                        });
                    });
                });
            }

            recalculateAll();
            renderAll();
        }"""

# Replace loadDatabaseData
pattern_db = r"async function loadDatabaseData\(\)\s*\{[\s\S]*?\n        \}"
html = re.sub(pattern_db, new_load_database_function, html)

# Replace loadLocalDataFallback
pattern_fallback = r"async function loadLocalDataFallback\(\)\s*\{[\s\S]*?\n        \}"
html = re.sub(pattern_fallback, new_fallback_function, html)

with open("index.html", "w", encoding="utf-8") as f:
    f.write(html)

with open("templates/index.html", "w", encoding="utf-8") as f:
    f.write(html)

print("Updated relative LM calculation so October LM dynamically pulls September CM!")
