import re

with open("index.html", "r", encoding="utf-8") as f:
    code = f.read()

# Replace the nested loadDatabaseData with ultra-robust flat parallel queries
new_load_function = """        async function loadDatabaseData() {
            if (!supabaseClient) return;
            try {
                // Fetch tables using flat parallel queries (immune to PostgREST schema cache issues)
                const [banksRes, managersRes, partnersRes, issuancesRes] = await Promise.all([
                    supabaseClient.from("banks").select("*").order("display_order"),
                    supabaseClient.from("managers").select("*").order("name"),
                    supabaseClient.from("channel_partners").select("*").order("name"),
                    supabaseClient.from("card_issuances").select("*")
                ]);

                if (banksRes.error || managersRes.error || partnersRes.error) {
                    const err = banksRes.error || managersRes.error || partnersRes.error || issuancesRes.error;
                    console.error("Supabase load error:", err);
                    showToast("Supabase Error: " + err.message, "error");
                    loadLocalDataFallback();
                    return;
                }

                const banks = banksRes.data || [];
                const managers = managersRes.data || [];
                const partners = partnersRes.data || [];
                const issuances = issuancesRes.data || [];

                // Build fast lookup map for issuances: partner_id -> { bank_id: { lm, cm, record_id } }
                const issuanceMap = {};
                issuances.forEach(ci => {
                    if (!issuanceMap[ci.partner_id]) issuanceMap[ci.partner_id] = {};
                    issuanceMap[ci.partner_id][ci.bank_id] = {
                        lm: ci.lm_count || 0,
                        cm: ci.cm_count || 0,
                        record_id: ci.id
                    };
                });

                // Assemble Managers and their Channel Partners
                dbData.banks = banks;
                dbData.managers = managers.map(m => {
                    const mappedPartners = partners.filter(p => p.manager_id === m.id).map(p => ({
                        id: p.id,
                        name: p.name,
                        working_capital: p.working_capital || 0,
                        banks: issuanceMap[p.id] || {}
                    }));

                    return {
                        id: m.id,
                        manager_name: m.name,
                        partners: mappedPartners
                    };
                });

                recalculateAll();
                renderAll();
                updateStatus(true, "Supabase Connected");
                showToast("Connected & synced with Supabase!", "success");
            } catch (err) {
                console.error("Database connection exception:", err);
                showToast("Connection error: " + err.message, "error");
                loadLocalDataFallback();
            }
        }"""

# Pattern to replace loadDatabaseData
pattern = r"async function loadDatabaseData\(\)\s*\{[\s\S]*?\n        \}"
code = re.sub(pattern, new_load_function, code)

with open("index.html", "w", encoding="utf-8") as f:
    f.write(code)

with open("templates/index.html", "w", encoding="utf-8") as f:
    f.write(code)

print("Replaced loadDatabaseData with flat robust queries!")
