import json

with open("initial_data.json", "r", encoding="utf-8") as f:
    data = json.load(f)

sql_lines = []

sql_lines.append("-- ========================================================")
sql_lines.append("-- 1. CREATE CORE TABLES")
sql_lines.append("-- ========================================================")
sql_lines.append("""
-- Enable UUID extension
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- Managers Table
CREATE TABLE IF NOT EXISTS managers (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    name TEXT UNIQUE NOT NULL,
    email TEXT,
    created_at TIMESTAMPTZ DEFAULT now()
);

-- Channel Partners Table
CREATE TABLE IF NOT EXISTS channel_partners (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    manager_id UUID REFERENCES managers(id) ON DELETE CASCADE,
    name TEXT NOT NULL,
    working_capital NUMERIC DEFAULT 0,
    created_at TIMESTAMPTZ DEFAULT now()
);

-- Banks Table
CREATE TABLE IF NOT EXISTS banks (
    id TEXT PRIMARY KEY,
    name TEXT NOT NULL,
    status TEXT DEFAULT 'FINAL',
    cutoff_day INT DEFAULT 30,
    display_order INT DEFAULT 0
);

-- Card Issuance Records (LM & CM counts per CP per Bank)
CREATE TABLE IF NOT EXISTS card_issuances (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    partner_id UUID REFERENCES channel_partners(id) ON DELETE CASCADE,
    bank_id TEXT REFERENCES banks(id) ON DELETE CASCADE,
    month_year TEXT NOT NULL DEFAULT '2026-09',
    lm_count INT DEFAULT 0,
    cm_count INT DEFAULT 0,
    updated_at TIMESTAMPTZ DEFAULT now(),
    UNIQUE(partner_id, bank_id, month_year)
);

-- Profiles / User Logins Table (for Supabase Auth integration)
CREATE TABLE IF NOT EXISTS profiles (
    id UUID PRIMARY KEY, -- Matches Supabase auth.users.id
    email TEXT,
    manager_id UUID REFERENCES managers(id) ON DELETE SET NULL,
    role TEXT NOT NULL DEFAULT 'manager', -- 'admin' or 'manager'
    created_at TIMESTAMPTZ DEFAULT now()
);
""")

sql_lines.append("\n-- ========================================================")
sql_lines.append("-- 2. CREATE AUTOMATIC SUM ROLL-UP SQL VIEWS")
sql_lines.append("-- ========================================================")
sql_lines.append("""
-- View 1: Channel Partner Summary View
CREATE OR REPLACE VIEW cp_card_summary AS
SELECT 
    cp.id AS partner_id,
    cp.name AS partner_name,
    cp.manager_id,
    m.name AS manager_name,
    cp.working_capital,
    COALESCE(SUM(ci.lm_count), 0) AS total_lmt,
    COALESCE(SUM(ci.cm_count), 0) AS total_cmt
FROM channel_partners cp
JOIN managers m ON m.id = cp.manager_id
LEFT JOIN card_issuances ci ON ci.partner_id = cp.id
GROUP BY cp.id, cp.name, cp.manager_id, m.name, cp.working_capital;

-- View 2: Manager Orange Header Rollup View (Sum of all CPs under manager)
CREATE OR REPLACE VIEW manager_rollup_summary AS
SELECT 
    m.id AS manager_id,
    m.name AS manager_name,
    COUNT(DISTINCT cp.id) AS total_cps,
    COALESCE(SUM(ci.lm_count), 0) AS total_lmt,
    COALESCE(SUM(ci.cm_count), 0) AS total_cmt,
    COALESCE(SUM(cp.working_capital), 0) AS total_working_capital
FROM managers m
LEFT JOIN channel_partners cp ON cp.manager_id = m.id
LEFT JOIN card_issuances ci ON ci.partner_id = cp.id
GROUP BY m.id, m.name;
""")

sql_lines.append("\n-- ========================================================")
sql_lines.append("-- 3. INSERT DEFAULT BANKS")
sql_lines.append("-- ========================================================")
banks = data.get("banks", [])
for idx, b in enumerate(banks, 1):
    cutoff = 21 if "21" in b.get("status", "") else 30
    sql_lines.append(f"INSERT INTO banks (id, name, status, cutoff_day, display_order) VALUES ('{b['id']}', '{b['name']}', '{b.get('status', 'FINAL')}', {cutoff}, {idx}) ON CONFLICT (id) DO UPDATE SET name = EXCLUDED.name, status = EXCLUDED.status;")

sql_lines.append("\n-- ========================================================")
sql_lines.append("-- 4. INSERT MANAGERS, CHANNEL PARTNERS & ISSUANCE NUMBERS")
sql_lines.append("-- ========================================================")

wc_data = data.get("working_capital", {})
managers = data.get("managers", [])

# Filter out empty manager placeholder if any
managers = [m for m in managers if m.get("partners")]

for m_idx, mgr in enumerate(managers):
    mgr_name = mgr["manager_name"].replace("'", "''")
    mgr_var = f"v_mgr_{m_idx}"
    sql_lines.append(f"\nDO $$")
    sql_lines.append(f"DECLARE")
    sql_lines.append(f"    {mgr_var} UUID;")
    sql_lines.append(f"    v_cp UUID;")
    sql_lines.append(f"BEGIN")
    sql_lines.append(f"    -- Insert or get Manager: {mgr_name}")
    sql_lines.append(f"    INSERT INTO managers (name) VALUES ('{mgr_name}') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO {mgr_var};")
    sql_lines.append(f"    IF {mgr_var} IS NULL THEN")
    sql_lines.append(f"        SELECT id INTO {mgr_var} FROM managers WHERE name = '{mgr_name}';")
    sql_lines.append(f"    END IF;")
    
    for p in mgr.get("partners", []):
        p_name = p["name"].replace("'", "''")
        capital = wc_data.get(p["name"], 0)
        sql_lines.append(f"\n    -- Insert CP: {p_name}")
        sql_lines.append(f"    INSERT INTO channel_partners (manager_id, name, working_capital) VALUES ({mgr_var}, '{p_name}', {capital}) RETURNING id INTO v_cp;")
        
        # Insert Bank issuance counts
        p_banks = p.get("banks", {})
        for b_id, counts in p_banks.items():
            lm = counts.get("lm", 0)
            cm = counts.get("cm", 0)
            if lm > 0 or cm > 0:
                sql_lines.append(f"    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, '{b_id}', '2026-09', {lm}, {cm}) ON CONFLICT DO NOTHING;")

    sql_lines.append(f"END $$;\n")

# Row Level Security (RLS) policies
sql_lines.append("\n-- ========================================================")
sql_lines.append("-- 5. ENABLE ROW LEVEL SECURITY & PERMISSIONS")
sql_lines.append("-- ========================================================")
sql_lines.append("""
-- Enable Row Level Security
ALTER TABLE managers ENABLE ROW LEVEL SECURITY;
ALTER TABLE channel_partners ENABLE ROW LEVEL SECURITY;
ALTER TABLE banks ENABLE ROW LEVEL SECURITY;
ALTER TABLE card_issuances ENABLE ROW LEVEL SECURITY;
ALTER TABLE profiles ENABLE ROW LEVEL SECURITY;

-- Allow public read & write access for anon key (for fast initial testing)
-- You can tighten this later to strict Supabase Auth logins!
CREATE POLICY "Public Read Access on Banks" ON banks FOR SELECT USING (true);
CREATE POLICY "Public Read Access on Managers" ON managers FOR SELECT USING (true);
CREATE POLICY "Public Read Access on Channel Partners" ON channel_partners FOR SELECT USING (true);
CREATE POLICY "Public Read Access on Card Issuances" ON card_issuances FOR SELECT USING (true);

CREATE POLICY "Public Insert/Update on Card Issuances" ON card_issuances FOR ALL USING (true) WITH CHECK (true);
CREATE POLICY "Public Insert/Update on Channel Partners" ON channel_partners FOR ALL USING (true) WITH CHECK (true);
CREATE POLICY "Public Insert/Update on Managers" ON managers FOR ALL USING (true) WITH CHECK (true);
""")

with open("supabase_schema_and_data.sql", "w", encoding="utf-8") as f:
    f.write("\n".join(sql_lines))

print("Generated supabase_schema_and_data.sql successfully!")
