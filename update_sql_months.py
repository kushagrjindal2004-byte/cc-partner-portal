with open("supabase_schema_and_data.sql", "r", encoding="utf-8") as f:
    sql = f.read()

# Add monthly_cycles table to SQL
monthly_cycles_sql = """
-- Monthly Tracking Cycles Table (Stores months, display names, and lock status)
CREATE TABLE IF NOT EXISTS monthly_cycles (
    code TEXT PRIMARY KEY, -- e.g. '2026-09'
    name TEXT NOT NULL,    -- e.g. 'September 2026'
    is_locked BOOLEAN DEFAULT false,
    prev_month_code TEXT,
    created_at TIMESTAMPTZ DEFAULT now()
);

-- Insert Default Monthly Cycles
INSERT INTO monthly_cycles (code, name, is_locked, prev_month_code) VALUES
('2026-08', 'August 2026', true, '2026-07'),
('2026-09', 'September 2026', false, '2026-08'),
('2026-10', 'October 2026', false, '2026-09')
ON CONFLICT (code) DO NOTHING;

ALTER TABLE monthly_cycles ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Public Read/Write on monthly_cycles" ON monthly_cycles FOR ALL USING (true) WITH CHECK (true);
"""

if "CREATE TABLE IF NOT EXISTS monthly_cycles" not in sql:
    # Insert right before section 2
    sql = sql.replace("-- 2. CREATE AUTOMATIC SUM ROLL-UP SQL VIEWS", monthly_cycles_sql + "\n-- 2. CREATE AUTOMATIC SUM ROLL-UP SQL VIEWS")

with open("supabase_schema_and_data.sql", "w", encoding="utf-8") as f:
    f.write(sql)

print("Added monthly_cycles table to supabase_schema_and_data.sql!")
