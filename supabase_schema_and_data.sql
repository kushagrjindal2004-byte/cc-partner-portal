-- ========================================================
-- 1. CREATE CORE TABLES
-- ========================================================

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


-- ========================================================
-- 2. CREATE AUTOMATIC SUM ROLL-UP SQL VIEWS
-- ========================================================

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


-- ========================================================
-- 3. INSERT DEFAULT BANKS
-- ========================================================
INSERT INTO banks (id, name, status, cutoff_day, display_order) VALUES ('au', 'AU', 'FINAL', 30, 1) ON CONFLICT (id) DO UPDATE SET name = EXCLUDED.name, status = EXCLUDED.status;
INSERT INTO banks (id, name, status, cutoff_day, display_order) VALUES ('axis', 'AXIS', 'FINAL', 30, 2) ON CONFLICT (id) DO UPDATE SET name = EXCLUDED.name, status = EXCLUDED.status;
INSERT INTO banks (id, name, status, cutoff_day, display_order) VALUES ('axis_lic', 'AXIS LIC', '21-SEP', 21, 3) ON CONFLICT (id) DO UPDATE SET name = EXCLUDED.name, status = EXCLUDED.status;
INSERT INTO banks (id, name, status, cutoff_day, display_order) VALUES ('hdfc', 'HDFC', 'FINAL', 30, 4) ON CONFLICT (id) DO UPDATE SET name = EXCLUDED.name, status = EXCLUDED.status;
INSERT INTO banks (id, name, status, cutoff_day, display_order) VALUES ('indus', 'INDUS', 'FINAL', 30, 5) ON CONFLICT (id) DO UPDATE SET name = EXCLUDED.name, status = EXCLUDED.status;
INSERT INTO banks (id, name, status, cutoff_day, display_order) VALUES ('sbi', 'SBI', 'FINAL', 30, 6) ON CONFLICT (id) DO UPDATE SET name = EXCLUDED.name, status = EXCLUDED.status;
INSERT INTO banks (id, name, status, cutoff_day, display_order) VALUES ('tata_neu', 'TATA NEU', 'FINAL', 30, 7) ON CONFLICT (id) DO UPDATE SET name = EXCLUDED.name, status = EXCLUDED.status;
INSERT INTO banks (id, name, status, cutoff_day, display_order) VALUES ('kiwi', 'KIWI', 'FINAL', 30, 8) ON CONFLICT (id) DO UPDATE SET name = EXCLUDED.name, status = EXCLUDED.status;
INSERT INTO banks (id, name, status, cutoff_day, display_order) VALUES ('bob', 'BOB', 'FINAL', 30, 9) ON CONFLICT (id) DO UPDATE SET name = EXCLUDED.name, status = EXCLUDED.status;
INSERT INTO banks (id, name, status, cutoff_day, display_order) VALUES ('yes_zaggle', 'YES ZAGGLE', 'FINAL', 30, 10) ON CONFLICT (id) DO UPDATE SET name = EXCLUDED.name, status = EXCLUDED.status;
INSERT INTO banks (id, name, status, cutoff_day, display_order) VALUES ('rbl', 'RBL', 'FINAL', 30, 11) ON CONFLICT (id) DO UPDATE SET name = EXCLUDED.name, status = EXCLUDED.status;

-- ========================================================
-- 4. INSERT MANAGERS, CHANNEL PARTNERS & ISSUANCE NUMBERS
-- ========================================================

DO $$
DECLARE
    v_mgr_0 UUID;
    v_cp UUID;
BEGIN
    -- Insert or get Manager: AZAM
    INSERT INTO managers (name) VALUES ('AZAM') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO v_mgr_0;
    IF v_mgr_0 IS NULL THEN
        SELECT id INTO v_mgr_0 FROM managers WHERE name = 'AZAM';
    END IF;

    -- Insert CP: DALEE
    INSERT INTO channel_partners (manager_id, name, working_capital) VALUES (v_mgr_0, 'DALEE', 0) RETURNING id INTO v_cp;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'hdfc', '2026-09', 1, 1) ON CONFLICT DO NOTHING;

    -- Insert CP: EASYCREDIT FINSERV
    INSERT INTO channel_partners (manager_id, name, working_capital) VALUES (v_mgr_0, 'EASYCREDIT FINSERV', 0) RETURNING id INTO v_cp;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'tata_neu', '2026-09', 136, 324) ON CONFLICT DO NOTHING;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'bob', '2026-09', 3, 8) ON CONFLICT DO NOTHING;

    -- Insert CP: SHAHDAT ALI
    INSERT INTO channel_partners (manager_id, name, working_capital) VALUES (v_mgr_0, 'SHAHDAT ALI', 0) RETURNING id INTO v_cp;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'hdfc', '2026-09', 0, 5) ON CONFLICT DO NOTHING;

    -- Insert CP: SUNIL YADAV
    INSERT INTO channel_partners (manager_id, name, working_capital) VALUES (v_mgr_0, 'SUNIL YADAV', 0) RETURNING id INTO v_cp;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'hdfc', '2026-09', 0, 1) ON CONFLICT DO NOTHING;

    -- Insert CP: SHUBHAM SHRIVASTAV
    INSERT INTO channel_partners (manager_id, name, working_capital) VALUES (v_mgr_0, 'SHUBHAM SHRIVASTAV', 0) RETURNING id INTO v_cp;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'hdfc', '2026-09', 1, 0) ON CONFLICT DO NOTHING;
END $$;


DO $$
DECLARE
    v_mgr_1 UUID;
    v_cp UUID;
BEGIN
    -- Insert or get Manager: INAYA
    INSERT INTO managers (name) VALUES ('INAYA') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO v_mgr_1;
    IF v_mgr_1 IS NULL THEN
        SELECT id INTO v_mgr_1 FROM managers WHERE name = 'INAYA';
    END IF;

    -- Insert CP: POONAM KAMBLE
    INSERT INTO channel_partners (manager_id, name, working_capital) VALUES (v_mgr_1, 'POONAM KAMBLE', 0) RETURNING id INTO v_cp;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'hdfc', '2026-09', 259, 154) ON CONFLICT DO NOTHING;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'tata_neu', '2026-09', 1097, 831) ON CONFLICT DO NOTHING;

    -- Insert CP: SANVIKA CREDIT ADVISORY
    INSERT INTO channel_partners (manager_id, name, working_capital) VALUES (v_mgr_1, 'SANVIKA CREDIT ADVISORY', 0) RETURNING id INTO v_cp;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'hdfc', '2026-09', 1, 0) ON CONFLICT DO NOTHING;

    -- Insert CP: AIM ENTERPRISES
    INSERT INTO channel_partners (manager_id, name, working_capital) VALUES (v_mgr_1, 'AIM ENTERPRISES', 0) RETURNING id INTO v_cp;

    -- Insert CP: Q GET FINANCIAL TECHNOLOGIES INDIA PVT LTD
    INSERT INTO channel_partners (manager_id, name, working_capital) VALUES (v_mgr_1, 'Q GET FINANCIAL TECHNOLOGIES INDIA PVT LTD', 2876727) RETURNING id INTO v_cp;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'tata_neu', '2026-09', 2073, 1926) ON CONFLICT DO NOTHING;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'bob', '2026-09', 0, 21) ON CONFLICT DO NOTHING;
END $$;


DO $$
DECLARE
    v_mgr_2 UUID;
    v_cp UUID;
BEGIN
    -- Insert or get Manager: BHAVANI
    INSERT INTO managers (name) VALUES ('BHAVANI') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO v_mgr_2;
    IF v_mgr_2 IS NULL THEN
        SELECT id INTO v_mgr_2 FROM managers WHERE name = 'BHAVANI';
    END IF;

    -- Insert CP: RUDRA
    INSERT INTO channel_partners (manager_id, name, working_capital) VALUES (v_mgr_2, 'RUDRA', 0) RETURNING id INTO v_cp;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'axis', '2026-09', 1, 0) ON CONFLICT DO NOTHING;

    -- Insert CP: ANIKET
    INSERT INTO channel_partners (manager_id, name, working_capital) VALUES (v_mgr_2, 'ANIKET', 0) RETURNING id INTO v_cp;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'axis', '2026-09', 0, 8) ON CONFLICT DO NOTHING;

    -- Insert CP: ANJANI PANDEY
    INSERT INTO channel_partners (manager_id, name, working_capital) VALUES (v_mgr_2, 'ANJANI PANDEY', 0) RETURNING id INTO v_cp;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'bob', '2026-09', 0, 2) ON CONFLICT DO NOTHING;

    -- Insert CP: G K TRADERS
    INSERT INTO channel_partners (manager_id, name, working_capital) VALUES (v_mgr_2, 'G K TRADERS', 0) RETURNING id INTO v_cp;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'axis', '2026-09', 0, 4) ON CONFLICT DO NOTHING;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'hdfc', '2026-09', 0, 1) ON CONFLICT DO NOTHING;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'sbi', '2026-09', 0, 7) ON CONFLICT DO NOTHING;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'bob', '2026-09', 2, 5) ON CONFLICT DO NOTHING;

    -- Insert CP: BALAJI ENTERPRISES
    INSERT INTO channel_partners (manager_id, name, working_capital) VALUES (v_mgr_2, 'BALAJI ENTERPRISES', 131448) RETURNING id INTO v_cp;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'bob', '2026-09', 0, 1) ON CONFLICT DO NOTHING;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'yes_zaggle', '2026-09', 1, 0) ON CONFLICT DO NOTHING;

    -- Insert CP: BALAJI SOLUTIONS WORK
    INSERT INTO channel_partners (manager_id, name, working_capital) VALUES (v_mgr_2, 'BALAJI SOLUTIONS WORK', 0) RETURNING id INTO v_cp;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'hdfc', '2026-09', 3, 0) ON CONFLICT DO NOTHING;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'indus', '2026-09', 1, 0) ON CONFLICT DO NOTHING;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'sbi', '2026-09', 0, 4) ON CONFLICT DO NOTHING;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'bob', '2026-09', 47, 98) ON CONFLICT DO NOTHING;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'rbl', '2026-09', 0, 2) ON CONFLICT DO NOTHING;

    -- Insert CP: HIRDESH
    INSERT INTO channel_partners (manager_id, name, working_capital) VALUES (v_mgr_2, 'HIRDESH', 0) RETURNING id INTO v_cp;

    -- Insert CP: HASMAT
    INSERT INTO channel_partners (manager_id, name, working_capital) VALUES (v_mgr_2, 'HASMAT', 0) RETURNING id INTO v_cp;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'bob', '2026-09', 18, 11) ON CONFLICT DO NOTHING;

    -- Insert CP: AED19 CARD SERVICES PVT LTD
    INSERT INTO channel_partners (manager_id, name, working_capital) VALUES (v_mgr_2, 'AED19 CARD SERVICES PVT LTD', 650391) RETURNING id INTO v_cp;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'bob', '2026-09', 0, 1) ON CONFLICT DO NOTHING;

    -- Insert CP: PRUDENTS
    INSERT INTO channel_partners (manager_id, name, working_capital) VALUES (v_mgr_2, 'PRUDENTS', 0) RETURNING id INTO v_cp;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'bob', '2026-09', 0, 1) ON CONFLICT DO NOTHING;

    -- Insert CP: SHIVAM
    INSERT INTO channel_partners (manager_id, name, working_capital) VALUES (v_mgr_2, 'SHIVAM', 0) RETURNING id INTO v_cp;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'bob', '2026-09', 1, 1) ON CONFLICT DO NOTHING;

    -- Insert CP: INFINITY ENTERPRISES
    INSERT INTO channel_partners (manager_id, name, working_capital) VALUES (v_mgr_2, 'INFINITY ENTERPRISES', 0) RETURNING id INTO v_cp;

    -- Insert CP: QUANTUMX GLOBAL PRIVATE LIMITED
    INSERT INTO channel_partners (manager_id, name, working_capital) VALUES (v_mgr_2, 'QUANTUMX GLOBAL PRIVATE LIMITED', 0) RETURNING id INTO v_cp;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'indus', '2026-09', 1, 1) ON CONFLICT DO NOTHING;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'bob', '2026-09', 168, 543) ON CONFLICT DO NOTHING;

    -- Insert CP: RAHUL KUMAR MISHRA
    INSERT INTO channel_partners (manager_id, name, working_capital) VALUES (v_mgr_2, 'RAHUL KUMAR MISHRA', 0) RETURNING id INTO v_cp;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'au', '2026-09', 1, 1) ON CONFLICT DO NOTHING;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'axis', '2026-09', 36, 36) ON CONFLICT DO NOTHING;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'hdfc', '2026-09', 7, 9) ON CONFLICT DO NOTHING;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'sbi', '2026-09', 19, 25) ON CONFLICT DO NOTHING;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'bob', '2026-09', 64, 206) ON CONFLICT DO NOTHING;

    -- Insert CP: SHAKSHI
    INSERT INTO channel_partners (manager_id, name, working_capital) VALUES (v_mgr_2, 'SHAKSHI', 0) RETURNING id INTO v_cp;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'hdfc', '2026-09', 1, 1) ON CONFLICT DO NOTHING;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'bob', '2026-09', 368, 259) ON CONFLICT DO NOTHING;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'rbl', '2026-09', 0, 2) ON CONFLICT DO NOTHING;

    -- Insert CP: VISHAL SHARMA
    INSERT INTO channel_partners (manager_id, name, working_capital) VALUES (v_mgr_2, 'VISHAL SHARMA', 0) RETURNING id INTO v_cp;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'axis', '2026-09', 7, 17) ON CONFLICT DO NOTHING;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'hdfc', '2026-09', 46, 47) ON CONFLICT DO NOTHING;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'indus', '2026-09', 0, 3) ON CONFLICT DO NOTHING;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'sbi', '2026-09', 1, 3) ON CONFLICT DO NOTHING;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'bob', '2026-09', 221, 347) ON CONFLICT DO NOTHING;

    -- Insert CP: TYAGI INFOSIS
    INSERT INTO channel_partners (manager_id, name, working_capital) VALUES (v_mgr_2, 'TYAGI INFOSIS', 133773) RETURNING id INTO v_cp;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'hdfc', '2026-09', 11, 11) ON CONFLICT DO NOTHING;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'tata_neu', '2026-09', 2, 0) ON CONFLICT DO NOTHING;

    -- Insert CP: SHIVANSHIENTERPRISES
    INSERT INTO channel_partners (manager_id, name, working_capital) VALUES (v_mgr_2, 'SHIVANSHIENTERPRISES', 0) RETURNING id INTO v_cp;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'hdfc', '2026-09', 0, 4) ON CONFLICT DO NOTHING;

    -- Insert CP: EXTRA
    INSERT INTO channel_partners (manager_id, name, working_capital) VALUES (v_mgr_2, 'EXTRA', 0) RETURNING id INTO v_cp;

    -- Insert CP: NEERAJ KUMAR
    INSERT INTO channel_partners (manager_id, name, working_capital) VALUES (v_mgr_2, 'NEERAJ KUMAR', 0) RETURNING id INTO v_cp;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'au', '2026-09', 3, 3) ON CONFLICT DO NOTHING;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'bob', '2026-09', 45, 89) ON CONFLICT DO NOTHING;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'rbl', '2026-09', 0, 2) ON CONFLICT DO NOTHING;

    -- Insert CP: JAI JAGANNATH CARDS SERVICES PRIVATE LIMITED
    INSERT INTO channel_partners (manager_id, name, working_capital) VALUES (v_mgr_2, 'JAI JAGANNATH CARDS SERVICES PRIVATE LIMITED', 0) RETURNING id INTO v_cp;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'hdfc', '2026-09', 0, 10) ON CONFLICT DO NOTHING;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'tata_neu', '2026-09', 11, 14) ON CONFLICT DO NOTHING;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'bob', '2026-09', 158, 251) ON CONFLICT DO NOTHING;

    -- Insert CP: RIYA
    INSERT INTO channel_partners (manager_id, name, working_capital) VALUES (v_mgr_2, 'RIYA', 0) RETURNING id INTO v_cp;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'sbi', '2026-09', 13, 8) ON CONFLICT DO NOTHING;

    -- Insert CP: SHILPA
    INSERT INTO channel_partners (manager_id, name, working_capital) VALUES (v_mgr_2, 'SHILPA', 0) RETURNING id INTO v_cp;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'au', '2026-09', 1, 1) ON CONFLICT DO NOTHING;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'axis', '2026-09', 2, 13) ON CONFLICT DO NOTHING;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'hdfc', '2026-09', 3, 7) ON CONFLICT DO NOTHING;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'bob', '2026-09', 13, 25) ON CONFLICT DO NOTHING;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'yes_zaggle', '2026-09', 2, 5) ON CONFLICT DO NOTHING;

    -- Insert CP: SUNIL
    INSERT INTO channel_partners (manager_id, name, working_capital) VALUES (v_mgr_2, 'SUNIL', 0) RETURNING id INTO v_cp;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'hdfc', '2026-09', 0, 14) ON CONFLICT DO NOTHING;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'tata_neu', '2026-09', 0, 2) ON CONFLICT DO NOTHING;

    -- Insert CP: SANJAY PATEL
    INSERT INTO channel_partners (manager_id, name, working_capital) VALUES (v_mgr_2, 'SANJAY PATEL', 0) RETURNING id INTO v_cp;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'axis', '2026-09', 0, 3) ON CONFLICT DO NOTHING;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'bob', '2026-09', 64, 32) ON CONFLICT DO NOTHING;

    -- Insert CP: SNEHA SHARMA
    INSERT INTO channel_partners (manager_id, name, working_capital) VALUES (v_mgr_2, 'SNEHA SHARMA', 0) RETURNING id INTO v_cp;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'axis_lic', '2026-09', 1, 0) ON CONFLICT DO NOTHING;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'sbi', '2026-09', 1, 0) ON CONFLICT DO NOTHING;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'bob', '2026-09', 0, 139) ON CONFLICT DO NOTHING;
END $$;


DO $$
DECLARE
    v_mgr_3 UUID;
    v_cp UUID;
BEGIN
    -- Insert or get Manager: BINOD MISHRA
    INSERT INTO managers (name) VALUES ('BINOD MISHRA') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO v_mgr_3;
    IF v_mgr_3 IS NULL THEN
        SELECT id INTO v_mgr_3 FROM managers WHERE name = 'BINOD MISHRA';
    END IF;

    -- Insert CP: BISHAL PAUL
    INSERT INTO channel_partners (manager_id, name, working_capital) VALUES (v_mgr_3, 'BISHAL PAUL', 0) RETURNING id INTO v_cp;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'hdfc', '2026-09', 10, 2) ON CONFLICT DO NOTHING;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'bob', '2026-09', 50, 1) ON CONFLICT DO NOTHING;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'yes_zaggle', '2026-09', 2, 0) ON CONFLICT DO NOTHING;

    -- Insert CP: ABHIPAY
    INSERT INTO channel_partners (manager_id, name, working_capital) VALUES (v_mgr_3, 'ABHIPAY', 0) RETURNING id INTO v_cp;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'tata_neu', '2026-09', 145, 425) ON CONFLICT DO NOTHING;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'bob', '2026-09', 0, 1) ON CONFLICT DO NOTHING;

    -- Insert CP: PROSENJIT CHATERJEE
    INSERT INTO channel_partners (manager_id, name, working_capital) VALUES (v_mgr_3, 'PROSENJIT CHATERJEE', 0) RETURNING id INTO v_cp;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'hdfc', '2026-09', 0, 3) ON CONFLICT DO NOTHING;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'indus', '2026-09', 2, 1) ON CONFLICT DO NOTHING;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'tata_neu', '2026-09', 5, 0) ON CONFLICT DO NOTHING;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'bob', '2026-09', 91, 180) ON CONFLICT DO NOTHING;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'yes_zaggle', '2026-09', 2, 2) ON CONFLICT DO NOTHING;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'rbl', '2026-09', 0, 14) ON CONFLICT DO NOTHING;

    -- Insert CP: FUNDCAP
    INSERT INTO channel_partners (manager_id, name, working_capital) VALUES (v_mgr_3, 'FUNDCAP', 0) RETURNING id INTO v_cp;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'axis', '2026-09', 0, 1) ON CONFLICT DO NOTHING;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'bob', '2026-09', 0, 12) ON CONFLICT DO NOTHING;

    -- Insert CP: EXTRA
    INSERT INTO channel_partners (manager_id, name, working_capital) VALUES (v_mgr_3, 'EXTRA', 0) RETURNING id INTO v_cp;

    -- Insert CP: PARTHA BHATTACHARJEE
    INSERT INTO channel_partners (manager_id, name, working_capital) VALUES (v_mgr_3, 'PARTHA BHATTACHARJEE', 0) RETURNING id INTO v_cp;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'tata_neu', '2026-09', 0, 1) ON CONFLICT DO NOTHING;

    -- Insert CP: GROWUP FINANCIAL
    INSERT INTO channel_partners (manager_id, name, working_capital) VALUES (v_mgr_3, 'GROWUP FINANCIAL', 0) RETURNING id INTO v_cp;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'axis', '2026-09', 1, 0) ON CONFLICT DO NOTHING;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'tata_neu', '2026-09', 1, 1) ON CONFLICT DO NOTHING;

    -- Insert CP: AMIT KUMAR
    INSERT INTO channel_partners (manager_id, name, working_capital) VALUES (v_mgr_3, 'AMIT KUMAR', 0) RETURNING id INTO v_cp;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'axis', '2026-09', 7, 5) ON CONFLICT DO NOTHING;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'hdfc', '2026-09', 0, 2) ON CONFLICT DO NOTHING;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'indus', '2026-09', 0, 1) ON CONFLICT DO NOTHING;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'tata_neu', '2026-09', 2, 3) ON CONFLICT DO NOTHING;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'bob', '2026-09', 10, 11) ON CONFLICT DO NOTHING;

    -- Insert CP: SUDIP POUL
    INSERT INTO channel_partners (manager_id, name, working_capital) VALUES (v_mgr_3, 'SUDIP POUL', 0) RETURNING id INTO v_cp;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'au', '2026-09', 0, 10) ON CONFLICT DO NOTHING;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'axis', '2026-09', 17, 23) ON CONFLICT DO NOTHING;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'hdfc', '2026-09', 1, 4) ON CONFLICT DO NOTHING;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'bob', '2026-09', 19, 48) ON CONFLICT DO NOTHING;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'yes_zaggle', '2026-09', 2, 3) ON CONFLICT DO NOTHING;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'rbl', '2026-09', 0, 11) ON CONFLICT DO NOTHING;

    -- Insert CP: S K RABI
    INSERT INTO channel_partners (manager_id, name, working_capital) VALUES (v_mgr_3, 'S K RABI', 0) RETURNING id INTO v_cp;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'bob', '2026-09', 0, 16) ON CONFLICT DO NOTHING;

    -- Insert CP: RR ASSOCIATES
    INSERT INTO channel_partners (manager_id, name, working_capital) VALUES (v_mgr_3, 'RR ASSOCIATES', 0) RETURNING id INTO v_cp;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'au', '2026-09', 35, 40) ON CONFLICT DO NOTHING;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'axis', '2026-09', 13, 16) ON CONFLICT DO NOTHING;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'hdfc', '2026-09', 13, 14) ON CONFLICT DO NOTHING;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'indus', '2026-09', 6, 7) ON CONFLICT DO NOTHING;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'sbi', '2026-09', 1, 5) ON CONFLICT DO NOTHING;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'tata_neu', '2026-09', 83, 19) ON CONFLICT DO NOTHING;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'bob', '2026-09', 19, 53) ON CONFLICT DO NOTHING;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'yes_zaggle', '2026-09', 2, 3) ON CONFLICT DO NOTHING;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'rbl', '2026-09', 0, 9) ON CONFLICT DO NOTHING;

    -- Insert CP: SRABANTI PAUL
    INSERT INTO channel_partners (manager_id, name, working_capital) VALUES (v_mgr_3, 'SRABANTI PAUL', 0) RETURNING id INTO v_cp;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'axis', '2026-09', 9, 16) ON CONFLICT DO NOTHING;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'hdfc', '2026-09', 2, 7) ON CONFLICT DO NOTHING;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'tata_neu', '2026-09', 5, 3) ON CONFLICT DO NOTHING;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'bob', '2026-09', 45, 46) ON CONFLICT DO NOTHING;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'yes_zaggle', '2026-09', 1, 1) ON CONFLICT DO NOTHING;

    -- Insert CP: SECUREPEAK SERVICE PVT LTD
    INSERT INTO channel_partners (manager_id, name, working_capital) VALUES (v_mgr_3, 'SECUREPEAK SERVICE PVT LTD', 0) RETURNING id INTO v_cp;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'au', '2026-09', 1, 0) ON CONFLICT DO NOTHING;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'axis', '2026-09', 0, 1) ON CONFLICT DO NOTHING;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'hdfc', '2026-09', 6, 2) ON CONFLICT DO NOTHING;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'tata_neu', '2026-09', 10, 8) ON CONFLICT DO NOTHING;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'bob', '2026-09', 11, 23) ON CONFLICT DO NOTHING;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'yes_zaggle', '2026-09', 11, 30) ON CONFLICT DO NOTHING;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'rbl', '2026-09', 0, 24) ON CONFLICT DO NOTHING;
END $$;


DO $$
DECLARE
    v_mgr_4 UUID;
    v_cp UUID;
BEGIN
    -- Insert or get Manager: DIVYAM
    INSERT INTO managers (name) VALUES ('DIVYAM') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO v_mgr_4;
    IF v_mgr_4 IS NULL THEN
        SELECT id INTO v_mgr_4 FROM managers WHERE name = 'DIVYAM';
    END IF;

    -- Insert CP: ATIK AHMED
    INSERT INTO channel_partners (manager_id, name, working_capital) VALUES (v_mgr_4, 'ATIK AHMED', 0) RETURNING id INTO v_cp;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'au', '2026-09', 2, 0) ON CONFLICT DO NOTHING;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'hdfc', '2026-09', 8, 4) ON CONFLICT DO NOTHING;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'indus', '2026-09', 2, 6) ON CONFLICT DO NOTHING;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'sbi', '2026-09', 0, 3) ON CONFLICT DO NOTHING;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'kiwi', '2026-09', 1, 0) ON CONFLICT DO NOTHING;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'bob', '2026-09', 3, 0) ON CONFLICT DO NOTHING;

    -- Insert CP: OWLOTS NEXTGEN PRIVATE LIMITED
    INSERT INTO channel_partners (manager_id, name, working_capital) VALUES (v_mgr_4, 'OWLOTS NEXTGEN PRIVATE LIMITED', 0) RETURNING id INTO v_cp;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'indus', '2026-09', 12, 4) ON CONFLICT DO NOTHING;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'sbi', '2026-09', 3, 4) ON CONFLICT DO NOTHING;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'bob', '2026-09', 61, 140) ON CONFLICT DO NOTHING;

    -- Insert CP: AMIT KUMAR
    INSERT INTO channel_partners (manager_id, name, working_capital) VALUES (v_mgr_4, 'AMIT KUMAR', 0) RETURNING id INTO v_cp;

    -- Insert CP: ABHISHEK
    INSERT INTO channel_partners (manager_id, name, working_capital) VALUES (v_mgr_4, 'ABHISHEK', 0) RETURNING id INTO v_cp;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'hdfc', '2026-09', 0, 3) ON CONFLICT DO NOTHING;

    -- Insert CP: HETAL
    INSERT INTO channel_partners (manager_id, name, working_capital) VALUES (v_mgr_4, 'HETAL', 0) RETURNING id INTO v_cp;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'sbi', '2026-09', 9, 11) ON CONFLICT DO NOTHING;

    -- Insert CP: ASHISH JANI
    INSERT INTO channel_partners (manager_id, name, working_capital) VALUES (v_mgr_4, 'ASHISH JANI', 0) RETURNING id INTO v_cp;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'au', '2026-09', 0, 1) ON CONFLICT DO NOTHING;

    -- Insert CP: GAJENDRA
    INSERT INTO channel_partners (manager_id, name, working_capital) VALUES (v_mgr_4, 'GAJENDRA', 0) RETURNING id INTO v_cp;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'tata_neu', '2026-09', 279, 521) ON CONFLICT DO NOTHING;

    -- Insert CP: FAIZAL
    INSERT INTO channel_partners (manager_id, name, working_capital) VALUES (v_mgr_4, 'FAIZAL', 0) RETURNING id INTO v_cp;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'axis', '2026-09', 2, 7) ON CONFLICT DO NOTHING;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'hdfc', '2026-09', 2, 0) ON CONFLICT DO NOTHING;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'indus', '2026-09', 1, 0) ON CONFLICT DO NOTHING;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'sbi', '2026-09', 110, 121) ON CONFLICT DO NOTHING;

    -- Insert CP: VIKRAM PUNE
    INSERT INTO channel_partners (manager_id, name, working_capital) VALUES (v_mgr_4, 'VIKRAM PUNE', 0) RETURNING id INTO v_cp;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'tata_neu', '2026-09', 20, 4) ON CONFLICT DO NOTHING;

    -- Insert CP: INTROSPECT FINANCIAL SERVICE
    INSERT INTO channel_partners (manager_id, name, working_capital) VALUES (v_mgr_4, 'INTROSPECT FINANCIAL SERVICE', 0) RETURNING id INTO v_cp;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'hdfc', '2026-09', 14, 32) ON CONFLICT DO NOTHING;

    -- Insert CP: VIKAS D
    INSERT INTO channel_partners (manager_id, name, working_capital) VALUES (v_mgr_4, 'VIKAS D', 0) RETURNING id INTO v_cp;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'bob', '2026-09', 0, 1) ON CONFLICT DO NOTHING;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'yes_zaggle', '2026-09', 1, 0) ON CONFLICT DO NOTHING;

    -- Insert CP: EXTRA
    INSERT INTO channel_partners (manager_id, name, working_capital) VALUES (v_mgr_4, 'EXTRA', 0) RETURNING id INTO v_cp;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'bob', '2026-09', 3, 0) ON CONFLICT DO NOTHING;

    -- Insert CP: MESHIYA HETALBEN TARUNKUMAR
    INSERT INTO channel_partners (manager_id, name, working_capital) VALUES (v_mgr_4, 'MESHIYA HETALBEN TARUNKUMAR', 0) RETURNING id INTO v_cp;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'bob', '2026-09', 0, 11) ON CONFLICT DO NOTHING;

    -- Insert CP: MILI PRADHAN
    INSERT INTO channel_partners (manager_id, name, working_capital) VALUES (v_mgr_4, 'MILI PRADHAN', 0) RETURNING id INTO v_cp;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'au', '2026-09', 1, 0) ON CONFLICT DO NOTHING;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'axis', '2026-09', 1, 0) ON CONFLICT DO NOTHING;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'hdfc', '2026-09', 2, 0) ON CONFLICT DO NOTHING;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'indus', '2026-09', 2, 0) ON CONFLICT DO NOTHING;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'bob', '2026-09', 8, 1) ON CONFLICT DO NOTHING;

    -- Insert CP: ANSH MANAGEMENT
    INSERT INTO channel_partners (manager_id, name, working_capital) VALUES (v_mgr_4, 'ANSH MANAGEMENT', 82919) RETURNING id INTO v_cp;
END $$;


DO $$
DECLARE
    v_mgr_5 UUID;
    v_cp UUID;
BEGIN
    -- Insert or get Manager: VINAY PANDEY
    INSERT INTO managers (name) VALUES ('VINAY PANDEY') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO v_mgr_5;
    IF v_mgr_5 IS NULL THEN
        SELECT id INTO v_mgr_5 FROM managers WHERE name = 'VINAY PANDEY';
    END IF;

    -- Insert CP: VINEET SHARMA
    INSERT INTO channel_partners (manager_id, name, working_capital) VALUES (v_mgr_5, 'VINEET SHARMA', 0) RETURNING id INTO v_cp;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'hdfc', '2026-09', 1, 3) ON CONFLICT DO NOTHING;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'sbi', '2026-09', 3, 0) ON CONFLICT DO NOTHING;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'bob', '2026-09', 0, 4) ON CONFLICT DO NOTHING;

    -- Insert CP: RIDHVIK FINANCIAL SERVICES
    INSERT INTO channel_partners (manager_id, name, working_capital) VALUES (v_mgr_5, 'RIDHVIK FINANCIAL SERVICES', 0) RETURNING id INTO v_cp;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'axis', '2026-09', 0, 3) ON CONFLICT DO NOTHING;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'indus', '2026-09', 8, 0) ON CONFLICT DO NOTHING;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'tata_neu', '2026-09', 36, 18) ON CONFLICT DO NOTHING;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'bob', '2026-09', 69, 272) ON CONFLICT DO NOTHING;

    -- Insert CP: AYUSH
    INSERT INTO channel_partners (manager_id, name, working_capital) VALUES (v_mgr_5, 'AYUSH', 0) RETURNING id INTO v_cp;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'indus', '2026-09', 5, 0) ON CONFLICT DO NOTHING;

    -- Insert CP: EXTRA
    INSERT INTO channel_partners (manager_id, name, working_capital) VALUES (v_mgr_5, 'EXTRA', 0) RETURNING id INTO v_cp;

    -- Insert CP: PRIYA CHAND
    INSERT INTO channel_partners (manager_id, name, working_capital) VALUES (v_mgr_5, 'PRIYA CHAND', 0) RETURNING id INTO v_cp;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'indus', '2026-09', 2, 1) ON CONFLICT DO NOTHING;

    -- Insert CP: AKSH CHOUHAN
    INSERT INTO channel_partners (manager_id, name, working_capital) VALUES (v_mgr_5, 'AKSH CHOUHAN', 0) RETURNING id INTO v_cp;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'sbi', '2026-09', 73, 48) ON CONFLICT DO NOTHING;

    -- Insert CP: KRISHNA
    INSERT INTO channel_partners (manager_id, name, working_capital) VALUES (v_mgr_5, 'KRISHNA', 0) RETURNING id INTO v_cp;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'bob', '2026-09', 9, 5) ON CONFLICT DO NOTHING;

    -- Insert CP: UNIQE MONEY
    INSERT INTO channel_partners (manager_id, name, working_capital) VALUES (v_mgr_5, 'UNIQE MONEY', 0) RETURNING id INTO v_cp;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'sbi', '2026-09', 0, 49) ON CONFLICT DO NOTHING;

    -- Insert CP: ABHISHEK DUTTA
    INSERT INTO channel_partners (manager_id, name, working_capital) VALUES (v_mgr_5, 'ABHISHEK DUTTA', 0) RETURNING id INTO v_cp;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'indus', '2026-09', 0, 2) ON CONFLICT DO NOTHING;

    -- Insert CP: FARMAN
    INSERT INTO channel_partners (manager_id, name, working_capital) VALUES (v_mgr_5, 'FARMAN', 0) RETURNING id INTO v_cp;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'hdfc', '2026-09', 7, 12) ON CONFLICT DO NOTHING;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'sbi', '2026-09', 12, 0) ON CONFLICT DO NOTHING;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'tata_neu', '2026-09', 0, 2) ON CONFLICT DO NOTHING;

    -- Insert CP: SWATI
    INSERT INTO channel_partners (manager_id, name, working_capital) VALUES (v_mgr_5, 'SWATI', 0) RETURNING id INTO v_cp;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'sbi', '2026-09', 0, 1) ON CONFLICT DO NOTHING;

    -- Insert CP: IMRAN
    INSERT INTO channel_partners (manager_id, name, working_capital) VALUES (v_mgr_5, 'IMRAN', 0) RETURNING id INTO v_cp;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'indus', '2026-09', 9, 4) ON CONFLICT DO NOTHING;

    -- Insert CP: SUNITA (BOOSTER SCORE SOLUTIONS PVT LTD)
    INSERT INTO channel_partners (manager_id, name, working_capital) VALUES (v_mgr_5, 'SUNITA (BOOSTER SCORE SOLUTIONS PVT LTD)', 0) RETURNING id INTO v_cp;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'axis', '2026-09', 11, 10) ON CONFLICT DO NOTHING;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'hdfc', '2026-09', 33, 55) ON CONFLICT DO NOTHING;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'indus', '2026-09', 1, 1) ON CONFLICT DO NOTHING;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'tata_neu', '2026-09', 198, 119) ON CONFLICT DO NOTHING;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'rbl', '2026-09', 0, 2) ON CONFLICT DO NOTHING;

    -- Insert CP: ANUBHAV GUPTA
    INSERT INTO channel_partners (manager_id, name, working_capital) VALUES (v_mgr_5, 'ANUBHAV GUPTA', 0) RETURNING id INTO v_cp;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'hdfc', '2026-09', 0, 17) ON CONFLICT DO NOTHING;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'sbi', '2026-09', 98, 61) ON CONFLICT DO NOTHING;

    -- Insert CP: SNEHLATA
    INSERT INTO channel_partners (manager_id, name, working_capital) VALUES (v_mgr_5, 'SNEHLATA', 0) RETURNING id INTO v_cp;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'sbi', '2026-09', 0, 41) ON CONFLICT DO NOTHING;

    -- Insert CP: FINSPARK
    INSERT INTO channel_partners (manager_id, name, working_capital) VALUES (v_mgr_5, 'FINSPARK', 0) RETURNING id INTO v_cp;

    -- Insert CP: ARUN KUMAR
    INSERT INTO channel_partners (manager_id, name, working_capital) VALUES (v_mgr_5, 'ARUN KUMAR', 0) RETURNING id INTO v_cp;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'axis', '2026-09', 0, 11) ON CONFLICT DO NOTHING;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'sbi', '2026-09', 88, 71) ON CONFLICT DO NOTHING;

    -- Insert CP: ARMAN RANJAN
    INSERT INTO channel_partners (manager_id, name, working_capital) VALUES (v_mgr_5, 'ARMAN RANJAN', 0) RETURNING id INTO v_cp;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'sbi', '2026-09', 7, 10) ON CONFLICT DO NOTHING;

    -- Insert CP: BHARAT ENTERPRISES (PATHWAY SOLUTION)
    INSERT INTO channel_partners (manager_id, name, working_capital) VALUES (v_mgr_5, 'BHARAT ENTERPRISES (PATHWAY SOLUTION)', 0) RETURNING id INTO v_cp;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'axis', '2026-09', 0, 33) ON CONFLICT DO NOTHING;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'axis_lic', '2026-09', 12, 0) ON CONFLICT DO NOTHING;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'hdfc', '2026-09', 8, 94) ON CONFLICT DO NOTHING;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'indus', '2026-09', 3, 7) ON CONFLICT DO NOTHING;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'sbi', '2026-09', 170, 145) ON CONFLICT DO NOTHING;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'tata_neu', '2026-09', 2, 2) ON CONFLICT DO NOTHING;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'bob', '2026-09', 27, 112) ON CONFLICT DO NOTHING;

    -- Insert CP: CAPITAL CALL SERVICE
    INSERT INTO channel_partners (manager_id, name, working_capital) VALUES (v_mgr_5, 'CAPITAL CALL SERVICE', 0) RETURNING id INTO v_cp;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'indus', '2026-09', 2, 0) ON CONFLICT DO NOTHING;

    -- Insert CP: CARDS EXPERTS
    INSERT INTO channel_partners (manager_id, name, working_capital) VALUES (v_mgr_5, 'CARDS EXPERTS', 0) RETURNING id INTO v_cp;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'axis', '2026-09', 0, 66) ON CONFLICT DO NOTHING;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'hdfc', '2026-09', 7, 0) ON CONFLICT DO NOTHING;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'sbi', '2026-09', 12, 25) ON CONFLICT DO NOTHING;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'bob', '2026-09', 0, 2) ON CONFLICT DO NOTHING;

    -- Insert CP: DEBSTER MEDIA PRIVATE LIMITED
    INSERT INTO channel_partners (manager_id, name, working_capital) VALUES (v_mgr_5, 'DEBSTER MEDIA PRIVATE LIMITED', 0) RETURNING id INTO v_cp;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'indus', '2026-09', 3, 3) ON CONFLICT DO NOTHING;

    -- Insert CP: ARPAN TYAGI
    INSERT INTO channel_partners (manager_id, name, working_capital) VALUES (v_mgr_5, 'ARPAN TYAGI', 0) RETURNING id INTO v_cp;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'sbi', '2026-09', 0, 6) ON CONFLICT DO NOTHING;

    -- Insert CP: KHUSHBOO SINGH
    INSERT INTO channel_partners (manager_id, name, working_capital) VALUES (v_mgr_5, 'KHUSHBOO SINGH', 0) RETURNING id INTO v_cp;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'indus', '2026-09', 0, 1) ON CONFLICT DO NOTHING;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'sbi', '2026-09', 50, 14) ON CONFLICT DO NOTHING;

    -- Insert CP: RAHUL
    INSERT INTO channel_partners (manager_id, name, working_capital) VALUES (v_mgr_5, 'RAHUL', 0) RETURNING id INTO v_cp;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'axis', '2026-09', 0, 2) ON CONFLICT DO NOTHING;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'sbi', '2026-09', 1, 18) ON CONFLICT DO NOTHING;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'bob', '2026-09', 0, 5) ON CONFLICT DO NOTHING;

    -- Insert CP: AMIT KUMAR SHARMA
    INSERT INTO channel_partners (manager_id, name, working_capital) VALUES (v_mgr_5, 'AMIT KUMAR SHARMA', 0) RETURNING id INTO v_cp;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'bob', '2026-09', 120, 87) ON CONFLICT DO NOTHING;

    -- Insert CP: MONEY MART
    INSERT INTO channel_partners (manager_id, name, working_capital) VALUES (v_mgr_5, 'MONEY MART', 67566) RETURNING id INTO v_cp;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'bob', '2026-09', 7, 12) ON CONFLICT DO NOTHING;

    -- Insert CP: NEHA SAINI
    INSERT INTO channel_partners (manager_id, name, working_capital) VALUES (v_mgr_5, 'NEHA SAINI', 0) RETURNING id INTO v_cp;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'sbi', '2026-09', 16, 18) ON CONFLICT DO NOTHING;

    -- Insert CP: S & P FINANCIAL SOLUTIONS
    INSERT INTO channel_partners (manager_id, name, working_capital) VALUES (v_mgr_5, 'S & P FINANCIAL SOLUTIONS', 0) RETURNING id INTO v_cp;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'axis', '2026-09', 0, 4) ON CONFLICT DO NOTHING;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'hdfc', '2026-09', 3, 8) ON CONFLICT DO NOTHING;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'sbi', '2026-09', 8, 15) ON CONFLICT DO NOTHING;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'tata_neu', '2026-09', 0, 1) ON CONFLICT DO NOTHING;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'bob', '2026-09', 40, 40) ON CONFLICT DO NOTHING;

    -- Insert CP: SUKRITI MANDAL
    INSERT INTO channel_partners (manager_id, name, working_capital) VALUES (v_mgr_5, 'SUKRITI MANDAL', 0) RETURNING id INTO v_cp;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'sbi', '2026-09', 76, 0) ON CONFLICT DO NOTHING;

    -- Insert CP: SANJAY SAINI
    INSERT INTO channel_partners (manager_id, name, working_capital) VALUES (v_mgr_5, 'SANJAY SAINI', 0) RETURNING id INTO v_cp;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'au', '2026-09', 0, 1) ON CONFLICT DO NOTHING;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'axis', '2026-09', 19, 20) ON CONFLICT DO NOTHING;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'hdfc', '2026-09', 12, 13) ON CONFLICT DO NOTHING;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'indus', '2026-09', 4, 1) ON CONFLICT DO NOTHING;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'sbi', '2026-09', 9, 10) ON CONFLICT DO NOTHING;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'bob', '2026-09', 14, 6) ON CONFLICT DO NOTHING;

    -- Insert CP: TEJPAL SINGH
    INSERT INTO channel_partners (manager_id, name, working_capital) VALUES (v_mgr_5, 'TEJPAL SINGH', 0) RETURNING id INTO v_cp;

    -- Insert CP: SKY HEIGHTS OUTSOURCING SOLUTIONS
    INSERT INTO channel_partners (manager_id, name, working_capital) VALUES (v_mgr_5, 'SKY HEIGHTS OUTSOURCING SOLUTIONS', 0) RETURNING id INTO v_cp;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'hdfc', '2026-09', 86, 92) ON CONFLICT DO NOTHING;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'tata_neu', '2026-09', 25, 69) ON CONFLICT DO NOTHING;

    -- Insert CP: PREETAM
    INSERT INTO channel_partners (manager_id, name, working_capital) VALUES (v_mgr_5, 'PREETAM', 0) RETURNING id INTO v_cp;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'bob', '2026-09', 4, 13) ON CONFLICT DO NOTHING;

    -- Insert CP: RN CARD EXPERTISE PRIVATE LIMITED
    INSERT INTO channel_partners (manager_id, name, working_capital) VALUES (v_mgr_5, 'RN CARD EXPERTISE PRIVATE LIMITED', 0) RETURNING id INTO v_cp;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'sbi', '2026-09', 113, 0) ON CONFLICT DO NOTHING;

    -- Insert CP: ZAHID
    INSERT INTO channel_partners (manager_id, name, working_capital) VALUES (v_mgr_5, 'ZAHID', 0) RETURNING id INTO v_cp;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'sbi', '2026-09', 38, 18) ON CONFLICT DO NOTHING;

    -- Insert CP: VIKAS
    INSERT INTO channel_partners (manager_id, name, working_capital) VALUES (v_mgr_5, 'VIKAS', 0) RETURNING id INTO v_cp;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'sbi', '2026-09', 140, 7) ON CONFLICT DO NOTHING;

    -- Insert CP: VARSHA RANI
    INSERT INTO channel_partners (manager_id, name, working_capital) VALUES (v_mgr_5, 'VARSHA RANI', 0) RETURNING id INTO v_cp;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'sbi', '2026-09', 3, 1) ON CONFLICT DO NOTHING;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'bob', '2026-09', 45, 43) ON CONFLICT DO NOTHING;

    -- Insert CP: SANTOSH KUMAR SHARMA
    INSERT INTO channel_partners (manager_id, name, working_capital) VALUES (v_mgr_5, 'SANTOSH KUMAR SHARMA', 0) RETURNING id INTO v_cp;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'tata_neu', '2026-09', 2, 3) ON CONFLICT DO NOTHING;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'bob', '2026-09', 0, 18) ON CONFLICT DO NOTHING;

    -- Insert CP: SHRESHREY CARD SERVICES PRIVATE LIMITED
    INSERT INTO channel_partners (manager_id, name, working_capital) VALUES (v_mgr_5, 'SHRESHREY CARD SERVICES PRIVATE LIMITED', 0) RETURNING id INTO v_cp;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'yes_zaggle', '2026-09', 6, 30) ON CONFLICT DO NOTHING;

    -- Insert CP: UMA SINGH ( SHIVI CARDS SERVICES)
    INSERT INTO channel_partners (manager_id, name, working_capital) VALUES (v_mgr_5, 'UMA SINGH ( SHIVI CARDS SERVICES)', 0) RETURNING id INTO v_cp;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'axis', '2026-09', 14, 0) ON CONFLICT DO NOTHING;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'indus', '2026-09', 5, 2) ON CONFLICT DO NOTHING;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'sbi', '2026-09', 0, 1) ON CONFLICT DO NOTHING;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'bob', '2026-09', 100, 261) ON CONFLICT DO NOTHING;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'rbl', '2026-09', 0, 10) ON CONFLICT DO NOTHING;

    -- Insert CP: RUPI BAZAAR FINTECH PVT LTD
    INSERT INTO channel_partners (manager_id, name, working_capital) VALUES (v_mgr_5, 'RUPI BAZAAR FINTECH PVT LTD', 0) RETURNING id INTO v_cp;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'indus', '2026-09', 4, 5) ON CONFLICT DO NOTHING;
END $$;


DO $$
DECLARE
    v_mgr_6 UUID;
    v_cp UUID;
BEGIN
    -- Insert or get Manager: ALKESH SHUKLA
    INSERT INTO managers (name) VALUES ('ALKESH SHUKLA') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO v_mgr_6;
    IF v_mgr_6 IS NULL THEN
        SELECT id INTO v_mgr_6 FROM managers WHERE name = 'ALKESH SHUKLA';
    END IF;

    -- Insert CP: ABHISHEK CHANYAL
    INSERT INTO channel_partners (manager_id, name, working_capital) VALUES (v_mgr_6, 'ABHISHEK CHANYAL', 0) RETURNING id INTO v_cp;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'hdfc', '2026-09', 0, 13) ON CONFLICT DO NOTHING;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'tata_neu', '2026-09', 0, 5) ON CONFLICT DO NOTHING;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'bob', '2026-09', 0, 2) ON CONFLICT DO NOTHING;

    -- Insert CP: MADHU YADAV
    INSERT INTO channel_partners (manager_id, name, working_capital) VALUES (v_mgr_6, 'MADHU YADAV', 0) RETURNING id INTO v_cp;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'au', '2026-09', 0, 1) ON CONFLICT DO NOTHING;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'hdfc', '2026-09', 1, 2) ON CONFLICT DO NOTHING;

    -- Insert CP: RITU SHUKLA
    INSERT INTO channel_partners (manager_id, name, working_capital) VALUES (v_mgr_6, 'RITU SHUKLA', 0) RETURNING id INTO v_cp;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'hdfc', '2026-09', 26, 26) ON CONFLICT DO NOTHING;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'indus', '2026-09', 2, 0) ON CONFLICT DO NOTHING;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'sbi', '2026-09', 3, 0) ON CONFLICT DO NOTHING;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'tata_neu', '2026-09', 0, 1) ON CONFLICT DO NOTHING;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'bob', '2026-09', 0, 6) ON CONFLICT DO NOTHING;

    -- Insert CP: ZAINAB NADEEM
    INSERT INTO channel_partners (manager_id, name, working_capital) VALUES (v_mgr_6, 'ZAINAB NADEEM', 0) RETURNING id INTO v_cp;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'hdfc', '2026-09', 2, 0) ON CONFLICT DO NOTHING;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'bob', '2026-09', 1, 0) ON CONFLICT DO NOTHING;

    -- Insert CP: UPENDRA KUMAR SINGH
    INSERT INTO channel_partners (manager_id, name, working_capital) VALUES (v_mgr_6, 'UPENDRA KUMAR SINGH', 86576) RETURNING id INTO v_cp;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'axis', '2026-09', 6, 1) ON CONFLICT DO NOTHING;

    -- Insert CP: VIJAY RASTOGI
    INSERT INTO channel_partners (manager_id, name, working_capital) VALUES (v_mgr_6, 'VIJAY RASTOGI', 0) RETURNING id INTO v_cp;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'hdfc', '2026-09', 2, 0) ON CONFLICT DO NOTHING;

    -- Insert CP: VIPIN KUMAR TIWARI
    INSERT INTO channel_partners (manager_id, name, working_capital) VALUES (v_mgr_6, 'VIPIN KUMAR TIWARI', 0) RETURNING id INTO v_cp;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'hdfc', '2026-09', 35, 1) ON CONFLICT DO NOTHING;
END $$;


DO $$
DECLARE
    v_mgr_7 UUID;
    v_cp UUID;
BEGIN
    -- Insert or get Manager: ZEESHAN HAIDER
    INSERT INTO managers (name) VALUES ('ZEESHAN HAIDER') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO v_mgr_7;
    IF v_mgr_7 IS NULL THEN
        SELECT id INTO v_mgr_7 FROM managers WHERE name = 'ZEESHAN HAIDER';
    END IF;

    -- Insert CP: ZEESHAN
    INSERT INTO channel_partners (manager_id, name, working_capital) VALUES (v_mgr_7, 'ZEESHAN', 0) RETURNING id INTO v_cp;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'bob', '2026-09', 99, 0) ON CONFLICT DO NOTHING;

    -- Insert CP: AFSANA BEGUM/AMIRUL
    INSERT INTO channel_partners (manager_id, name, working_capital) VALUES (v_mgr_7, 'AFSANA BEGUM/AMIRUL', 0) RETURNING id INTO v_cp;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'axis', '2026-09', 0, 3) ON CONFLICT DO NOTHING;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'hdfc', '2026-09', 4, 26) ON CONFLICT DO NOTHING;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'bob', '2026-09', 0, 4) ON CONFLICT DO NOTHING;

    -- Insert CP: ADVENTURIA THRILL INDIA PRIVATE LIMITED
    INSERT INTO channel_partners (manager_id, name, working_capital) VALUES (v_mgr_7, 'ADVENTURIA THRILL INDIA PRIVATE LIMITED', 0) RETURNING id INTO v_cp;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'bob', '2026-09', 96, 147) ON CONFLICT DO NOTHING;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'yes_zaggle', '2026-09', 0, 1) ON CONFLICT DO NOTHING;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'rbl', '2026-09', 0, 3) ON CONFLICT DO NOTHING;

    -- Insert CP: CREDITLO BUSINESS SOLUTIONS
    INSERT INTO channel_partners (manager_id, name, working_capital) VALUES (v_mgr_7, 'CREDITLO BUSINESS SOLUTIONS', 0) RETURNING id INTO v_cp;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'tata_neu', '2026-09', 6, 20) ON CONFLICT DO NOTHING;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'bob', '2026-09', 5, 5) ON CONFLICT DO NOTHING;

    -- Insert CP: SALEEM
    INSERT INTO channel_partners (manager_id, name, working_capital) VALUES (v_mgr_7, 'SALEEM', 0) RETURNING id INTO v_cp;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'hdfc', '2026-09', 204, 885) ON CONFLICT DO NOTHING;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'tata_neu', '2026-09', 464, 918) ON CONFLICT DO NOTHING;

    -- Insert CP: EXTRA
    INSERT INTO channel_partners (manager_id, name, working_capital) VALUES (v_mgr_7, 'EXTRA', 0) RETURNING id INTO v_cp;

    -- Insert CP: CREDBAE
    INSERT INTO channel_partners (manager_id, name, working_capital) VALUES (v_mgr_7, 'CREDBAE', 0) RETURNING id INTO v_cp;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'axis', '2026-09', 1, 0) ON CONFLICT DO NOTHING;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'hdfc', '2026-09', 1, 0) ON CONFLICT DO NOTHING;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'bob', '2026-09', 0, 1) ON CONFLICT DO NOTHING;

    -- Insert CP: BHUVNESH
    INSERT INTO channel_partners (manager_id, name, working_capital) VALUES (v_mgr_7, 'BHUVNESH', 0) RETURNING id INTO v_cp;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'bob', '2026-09', 0, 10) ON CONFLICT DO NOTHING;

    -- Insert CP: SWATI (ZEESHAN)
    INSERT INTO channel_partners (manager_id, name, working_capital) VALUES (v_mgr_7, 'SWATI (ZEESHAN)', 0) RETURNING id INTO v_cp;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'bob', '2026-09', 0, 2) ON CONFLICT DO NOTHING;

    -- Insert CP: LAKSHAY RATHORE
    INSERT INTO channel_partners (manager_id, name, working_capital) VALUES (v_mgr_7, 'LAKSHAY RATHORE', 0) RETURNING id INTO v_cp;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'indus', '2026-09', 2, 0) ON CONFLICT DO NOTHING;

    -- Insert CP: GULREZ
    INSERT INTO channel_partners (manager_id, name, working_capital) VALUES (v_mgr_7, 'GULREZ', 0) RETURNING id INTO v_cp;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'hdfc', '2026-09', 5, 0) ON CONFLICT DO NOTHING;

    -- Insert CP: I DOOR WEALTH MENAGMENT
    INSERT INTO channel_partners (manager_id, name, working_capital) VALUES (v_mgr_7, 'I DOOR WEALTH MENAGMENT', 0) RETURNING id INTO v_cp;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'axis', '2026-09', 4, 11) ON CONFLICT DO NOTHING;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'hdfc', '2026-09', 0, 2) ON CONFLICT DO NOTHING;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'sbi', '2026-09', 0, 3) ON CONFLICT DO NOTHING;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'tata_neu', '2026-09', 2, 0) ON CONFLICT DO NOTHING;

    -- Insert CP: GB ENTERPRISE
    INSERT INTO channel_partners (manager_id, name, working_capital) VALUES (v_mgr_7, 'GB ENTERPRISE', 0) RETURNING id INTO v_cp;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'bob', '2026-09', 2, 0) ON CONFLICT DO NOTHING;

    -- Insert CP: FARHAD
    INSERT INTO channel_partners (manager_id, name, working_capital) VALUES (v_mgr_7, 'FARHAD', 0) RETURNING id INTO v_cp;

    -- Insert CP: TELERING PROCESS PVT LTD
    INSERT INTO channel_partners (manager_id, name, working_capital) VALUES (v_mgr_7, 'TELERING PROCESS PVT LTD', 0) RETURNING id INTO v_cp;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'axis', '2026-09', 10, 15) ON CONFLICT DO NOTHING;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'axis_lic', '2026-09', 3, 2) ON CONFLICT DO NOTHING;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'hdfc', '2026-09', 8, 26) ON CONFLICT DO NOTHING;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'indus', '2026-09', 10, 4) ON CONFLICT DO NOTHING;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'sbi', '2026-09', 3, 6) ON CONFLICT DO NOTHING;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'tata_neu', '2026-09', 594, 188) ON CONFLICT DO NOTHING;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'bob', '2026-09', 7, 276) ON CONFLICT DO NOTHING;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'yes_zaggle', '2026-09', 5, 11) ON CONFLICT DO NOTHING;
    INSERT INTO card_issuances (partner_id, bank_id, month_year, lm_count, cm_count) VALUES (v_cp, 'rbl', '2026-09', 0, 26) ON CONFLICT DO NOTHING;
END $$;


-- ========================================================
-- 5. ENABLE ROW LEVEL SECURITY & PERMISSIONS
-- ========================================================

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
