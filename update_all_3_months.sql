-- ===========================================================================
-- COMPLETE SUPABASE SEED SCRIPT FOR JULY, AUGUST, SEPTEMBER, AND OCTOBER 2026
-- ===========================================================================

-- Ensure columns and extensions exist
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
ALTER TABLE managers ADD COLUMN IF NOT EXISTS pin_code TEXT DEFAULT '1234';
ALTER TABLE banks ADD COLUMN IF NOT EXISTS display_order INT DEFAULT 0;
ALTER TABLE channel_partners ADD COLUMN IF NOT EXISTS working_capital NUMERIC DEFAULT 0;

-- 1. Master Banks
INSERT INTO banks (id, name, status, display_order) VALUES ('au', 'AU', 'FINAL', 1) ON CONFLICT (id) DO UPDATE SET name=EXCLUDED.name, status=EXCLUDED.status, display_order=EXCLUDED.display_order;
INSERT INTO banks (id, name, status, display_order) VALUES ('axis', 'AXIS', 'FINAL', 2) ON CONFLICT (id) DO UPDATE SET name=EXCLUDED.name, status=EXCLUDED.status, display_order=EXCLUDED.display_order;
INSERT INTO banks (id, name, status, display_order) VALUES ('axis_lic', 'AXIS LIC', 'FINAL', 3) ON CONFLICT (id) DO UPDATE SET name=EXCLUDED.name, status=EXCLUDED.status, display_order=EXCLUDED.display_order;
INSERT INTO banks (id, name, status, display_order) VALUES ('hdfc', 'HDFC', 'FINAL', 4) ON CONFLICT (id) DO UPDATE SET name=EXCLUDED.name, status=EXCLUDED.status, display_order=EXCLUDED.display_order;
INSERT INTO banks (id, name, status, display_order) VALUES ('idfc', 'IDFC', 'FINAL', 5) ON CONFLICT (id) DO UPDATE SET name=EXCLUDED.name, status=EXCLUDED.status, display_order=EXCLUDED.display_order;
INSERT INTO banks (id, name, status, display_order) VALUES ('indus', 'INDUS', 'FINAL', 6) ON CONFLICT (id) DO UPDATE SET name=EXCLUDED.name, status=EXCLUDED.status, display_order=EXCLUDED.display_order;
INSERT INTO banks (id, name, status, display_order) VALUES ('sbi', 'SBI', 'FINAL', 7) ON CONFLICT (id) DO UPDATE SET name=EXCLUDED.name, status=EXCLUDED.status, display_order=EXCLUDED.display_order;
INSERT INTO banks (id, name, status, display_order) VALUES ('tata_neu', 'TATA NEU', 'FINAL', 8) ON CONFLICT (id) DO UPDATE SET name=EXCLUDED.name, status=EXCLUDED.status, display_order=EXCLUDED.display_order;
INSERT INTO banks (id, name, status, display_order) VALUES ('kiwi', 'KIWI', 'FINAL', 9) ON CONFLICT (id) DO UPDATE SET name=EXCLUDED.name, status=EXCLUDED.status, display_order=EXCLUDED.display_order;
INSERT INTO banks (id, name, status, display_order) VALUES ('bob', 'BOB', 'FINAL', 10) ON CONFLICT (id) DO UPDATE SET name=EXCLUDED.name, status=EXCLUDED.status, display_order=EXCLUDED.display_order;
INSERT INTO banks (id, name, status, display_order) VALUES ('yes_zaggle', 'YES ZAGGLE', 'FINAL', 11) ON CONFLICT (id) DO UPDATE SET name=EXCLUDED.name, status=EXCLUDED.status, display_order=EXCLUDED.display_order;
INSERT INTO banks (id, name, status, display_order) VALUES ('icici', 'ICICI BANK', 'FINAL', 12) ON CONFLICT (id) DO UPDATE SET name=EXCLUDED.name, status=EXCLUDED.status, display_order=EXCLUDED.display_order;
INSERT INTO banks (id, name, status, display_order) VALUES ('rbl', 'RBL', 'FINAL', 13) ON CONFLICT (id) DO UPDATE SET name=EXCLUDED.name, status=EXCLUDED.status, display_order=EXCLUDED.display_order;

-- 2. Monthly Cycles
INSERT INTO monthly_cycles (code, name, is_locked, prev_month_code) VALUES ('2026-07', 'July 2026', true, '2026-06') ON CONFLICT (code) DO UPDATE SET name=EXCLUDED.name, is_locked=EXCLUDED.is_locked, prev_month_code=EXCLUDED.prev_month_code;
INSERT INTO monthly_cycles (code, name, is_locked, prev_month_code) VALUES ('2026-08', 'August 2026', true, '2026-07') ON CONFLICT (code) DO UPDATE SET name=EXCLUDED.name, is_locked=EXCLUDED.is_locked, prev_month_code=EXCLUDED.prev_month_code;
INSERT INTO monthly_cycles (code, name, is_locked, prev_month_code) VALUES ('2026-09', 'September 2026', false, '2026-08') ON CONFLICT (code) DO UPDATE SET name=EXCLUDED.name, is_locked=EXCLUDED.is_locked, prev_month_code=EXCLUDED.prev_month_code;
INSERT INTO monthly_cycles (code, name, is_locked, prev_month_code) VALUES ('2026-10', 'October 2026', false, '2026-09') ON CONFLICT (code) DO UPDATE SET name=EXCLUDED.name, is_locked=EXCLUDED.is_locked, prev_month_code=EXCLUDED.prev_month_code;

-- 3. Managers, Channel Partners, and Card Issuances
DO $$
DECLARE
    v_mgr UUID;
    v_cp UUID;
BEGIN

    INSERT INTO managers (name, pin_code)
    VALUES ('AZAM', '1234')
    ON CONFLICT (name) DO UPDATE SET pin_code=EXCLUDED.pin_code;
    

    INSERT INTO managers (name, pin_code)
    VALUES ('INAYA', '1234')
    ON CONFLICT (name) DO UPDATE SET pin_code=EXCLUDED.pin_code;
    

    INSERT INTO managers (name, pin_code)
    VALUES ('BHAVANI', '1234')
    ON CONFLICT (name) DO UPDATE SET pin_code=EXCLUDED.pin_code;
    

    INSERT INTO managers (name, pin_code)
    VALUES ('BINOD MISHRA', '1234')
    ON CONFLICT (name) DO UPDATE SET pin_code=EXCLUDED.pin_code;
    

    INSERT INTO managers (name, pin_code)
    VALUES ('DIVYAM', '1234')
    ON CONFLICT (name) DO UPDATE SET pin_code=EXCLUDED.pin_code;
    

    INSERT INTO managers (name, pin_code)
    VALUES ('VINAY PANDEY', '1234')
    ON CONFLICT (name) DO UPDATE SET pin_code=EXCLUDED.pin_code;
    

    INSERT INTO managers (name, pin_code)
    VALUES ('ALKESH SHUKLA', '1234')
    ON CONFLICT (name) DO UPDATE SET pin_code=EXCLUDED.pin_code;
    

    INSERT INTO managers (name, pin_code)
    VALUES ('ZEESHAN HAIDER', '1234')
    ON CONFLICT (name) DO UPDATE SET pin_code=EXCLUDED.pin_code;
    

    -- Manager: AZAM
    SELECT id INTO v_mgr FROM managers WHERE name = 'AZAM' LIMIT 1;

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('DALEE', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'DALEE' LIMIT 1;
    END IF;
        
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'hdfc', 9, 8) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'tata_neu', 5, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'hdfc', 8, 1) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'hdfc', 1, 1) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'hdfc', 1, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('EASYCREDIT FINSERV', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'EASYCREDIT FINSERV' LIMIT 1;
    END IF;
        
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'axis', 1, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'hdfc', 65, 4) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'tata_neu', 58, 188) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'bob', 1, 4) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'yes_zaggle', 2, 1) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'icici', 1, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'hdfc', 4, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'tata_neu', 188, 136) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'bob', 4, 3) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'yes_zaggle', 1, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'tata_neu', 136, 324) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'bob', 3, 8) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'tata_neu', 324, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'bob', 8, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('SUNIL YADAV', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'SUNIL YADAV' LIMIT 1;
    END IF;
        
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'hdfc', 5, 1) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'hdfc', 1, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'hdfc', 0, 1) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'hdfc', 1, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('SHUBHAM SHRIVASTAV', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'SHUBHAM SHRIVASTAV' LIMIT 1;
    END IF;
        
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'hdfc', 7, 9) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'hdfc', 9, 1) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'hdfc', 1, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('SHAHDAT ALI', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'SHAHDAT ALI' LIMIT 1;
    END IF;
        
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'hdfc', 0, 5) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'hdfc', 5, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;

    -- Manager: INAYA
    SELECT id INTO v_mgr FROM managers WHERE name = 'INAYA' LIMIT 1;

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('POONAM KAMBLE', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'POONAM KAMBLE' LIMIT 1;
    END IF;
        
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'hdfc', 187, 274) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'tata_neu', 908, 1068) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'hdfc', 274, 259) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'tata_neu', 1068, 1097) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'hdfc', 259, 154) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'tata_neu', 1097, 831) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'hdfc', 154, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'tata_neu', 831, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('DIVINE ENTERPRISES', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'DIVINE ENTERPRISES' LIMIT 1;
    END IF;
        
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'hdfc', 1, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('AIM ENTERPRISES', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'AIM ENTERPRISES' LIMIT 1;
    END IF;
        
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'hdfc', 15, 2) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'hdfc', 2, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('Q GET FINANCIAL TECHNOLOGIES INDIA PVT LTD', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'Q GET FINANCIAL TECHNOLOGIES INDIA PVT LTD' LIMIT 1;
    END IF;
        
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'hdfc', 63, 15) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'idfc', 64, 23) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'tata_neu', 0, 25) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'hdfc', 15, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'idfc', 23, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'tata_neu', 25, 2073) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'tata_neu', 2073, 1926) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'bob', 0, 21) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'tata_neu', 1926, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'bob', 21, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('SANVIKA CREDIT ADVISORY', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'SANVIKA CREDIT ADVISORY' LIMIT 1;
    END IF;
        
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'hdfc', 0, 1) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'hdfc', 1, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;

    -- Manager: BHAVANI
    SELECT id INTO v_mgr FROM managers WHERE name = 'BHAVANI' LIMIT 1;

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('ABHAY PANDEY', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'ABHAY PANDEY' LIMIT 1;
    END IF;
        

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('ANIKET', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'ANIKET' LIMIT 1;
    END IF;
        
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'axis', 0, 8) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'axis', 8, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('RUDRA', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'RUDRA' LIMIT 1;
    END IF;
        
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'axis', 0, 5) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'axis', 5, 1) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'axis', 1, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('ANKIT KUMAR', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'ANKIT KUMAR' LIMIT 1;
    END IF;
        

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('ARVIND SINGH', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'ARVIND SINGH' LIMIT 1;
    END IF;
        

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('NARESH', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'NARESH' LIMIT 1;
    END IF;
        

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('G K TRADERS', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'G K TRADERS' LIMIT 1;
    END IF;
        
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'axis', 3, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'hdfc', 4, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'bob', 1, 3) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'yes_zaggle', 3, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'bob', 3, 2) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'axis', 0, 4) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'hdfc', 0, 1) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'sbi', 0, 7) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'bob', 2, 5) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'axis', 4, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'hdfc', 1, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'sbi', 7, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'bob', 5, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('BALAJI ENTERPRISES', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'BALAJI ENTERPRISES' LIMIT 1;
    END IF;
        
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'au', 1, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'axis', 1, 3) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'idfc', 1, 1) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'indus', 3, 9) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'tata_neu', 2, 1) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'bob', 6, 14) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'axis', 3, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'idfc', 1, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'indus', 9, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'tata_neu', 1, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'bob', 14, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'bob', 0, 1) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'yes_zaggle', 1, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'bob', 1, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('BALAJI SOLUTIONS WORK', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'BALAJI SOLUTIONS WORK' LIMIT 1;
    END IF;
        
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'hdfc', 0, 1) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'idfc', 0, 2) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'indus', 3, 2) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'sbi', 2, 1) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'bob', 49, 25) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'hdfc', 1, 3) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'idfc', 2, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'indus', 2, 1) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'sbi', 1, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'bob', 25, 47) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'hdfc', 3, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'indus', 1, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'sbi', 0, 4) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'bob', 47, 98) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'rbl', 0, 2) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'sbi', 4, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'bob', 98, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'rbl', 2, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('QUICK SOLUTIONS', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'QUICK SOLUTIONS' LIMIT 1;
    END IF;
        

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('HIRDESH', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'HIRDESH' LIMIT 1;
    END IF;
        
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'idfc', 0, 1) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'idfc', 1, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('CENTURY CORPORATE SERVICE', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'CENTURY CORPORATE SERVICE' LIMIT 1;
    END IF;
        

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('SAMARTH ENTERPRISES', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'SAMARTH ENTERPRISES' LIMIT 1;
    END IF;
        

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('HASMAT', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'HASMAT' LIMIT 1;
    END IF;
        
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'idfc', 2, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'indus', 21, 6) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'bob', 14, 21) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'indus', 6, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'bob', 21, 18) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'bob', 18, 11) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'bob', 11, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('FINANCIAL GLOBAL SERVICE', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'FINANCIAL GLOBAL SERVICE' LIMIT 1;
    END IF;
        

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('SHIVAM', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'SHIVAM' LIMIT 1;
    END IF;
        
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'bob', 34, 6) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'bob', 6, 1) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'yes_zaggle', 0, 1) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'bob', 1, 1) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'bob', 1, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('INFINITY ENTERPRISES', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'INFINITY ENTERPRISES' LIMIT 1;
    END IF;
        
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'hdfc', 9, 1) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'idfc', 1, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'hdfc', 1, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('ACCURATE CARDS AND DISTRIBUTION', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'ACCURATE CARDS AND DISTRIBUTION' LIMIT 1;
    END IF;
        

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('NASEEM AHMAD (KD ENTERPRISES)', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'NASEEM AHMAD (KD ENTERPRISES)' LIMIT 1;
    END IF;
        

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('VIKRAM SINGH PATEL', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'VIKRAM SINGH PATEL' LIMIT 1;
    END IF;
        

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('OSR FINANCIAL SERVICES', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'OSR FINANCIAL SERVICES' LIMIT 1;
    END IF;
        

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('QUANTUMX GLOBAL PRIVATE LIMITED', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'QUANTUMX GLOBAL PRIVATE LIMITED' LIMIT 1;
    END IF;
        
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'idfc', 50, 34) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'indus', 7, 13) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'bob', 66, 112) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'idfc', 34, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'indus', 13, 1) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'bob', 112, 168) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'indus', 1, 1) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'bob', 168, 543) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'indus', 1, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'bob', 543, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('PRUDENS TELESERVICES', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'PRUDENS TELESERVICES' LIMIT 1;
    END IF;
        

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('RAHUL KUMAR MISHRA', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'RAHUL KUMAR MISHRA' LIMIT 1;
    END IF;
        
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'au', 0, 3) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'axis', 0, 39) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'hdfc', 0, 6) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'indus', 1, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'sbi', 12, 19) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'bob', 82, 75) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'au', 3, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'axis', 39, 36) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'hdfc', 6, 7) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'sbi', 19, 19) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'bob', 75, 64) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'au', 1, 1) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'axis', 36, 36) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'hdfc', 7, 9) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'sbi', 19, 25) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'bob', 64, 206) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'au', 1, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'axis', 36, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'hdfc', 9, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'sbi', 25, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'bob', 206, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('SHAKSHI', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'SHAKSHI' LIMIT 1;
    END IF;
        
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'bob', 145, 143) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'au', 0, 1) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'hdfc', 0, 1) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'bob', 143, 368) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'hdfc', 1, 1) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'bob', 368, 259) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'rbl', 0, 2) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'hdfc', 1, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'bob', 259, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'rbl', 2, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('AED 19 CARD SERVICES PVT LTD', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'AED 19 CARD SERVICES PVT LTD' LIMIT 1;
    END IF;
        
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'idfc', 5, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'indus', 1, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'sbi', 2, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'bob', 9, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('VISHAL SHARMA', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'VISHAL SHARMA' LIMIT 1;
    END IF;
        
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'axis', 6, 12) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'hdfc', 72, 62) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'idfc', 2, 24) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'indus', 6, 6) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'sbi', 4, 3) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'kiwi', 1, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'bob', 112, 100) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'axis', 12, 7) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'hdfc', 62, 46) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'idfc', 24, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'indus', 6, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'sbi', 3, 1) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'bob', 100, 221) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'axis', 7, 17) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'hdfc', 46, 47) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'indus', 0, 3) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'sbi', 1, 3) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'bob', 221, 347) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'axis', 17, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'hdfc', 47, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'indus', 3, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'sbi', 3, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'bob', 347, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('SAGAR', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'SAGAR' LIMIT 1;
    END IF;
        

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('DEV ASSOCIATES', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'DEV ASSOCIATES' LIMIT 1;
    END IF;
        

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('SUNNY', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'SUNNY' LIMIT 1;
    END IF;
        

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('MAYTAWI INDUSTRY PVT LTD', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'MAYTAWI INDUSTRY PVT LTD' LIMIT 1;
    END IF;
        

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('NAAZ', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'NAAZ' LIMIT 1;
    END IF;
        

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('TYAGI INFOSIS', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'TYAGI INFOSIS' LIMIT 1;
    END IF;
        
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'hdfc', 20, 13) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'indus', 0, 1) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'hdfc', 13, 11) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'indus', 1, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'tata_neu', 0, 2) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'hdfc', 11, 11) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'tata_neu', 2, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'hdfc', 11, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('NEERAJ KUMAR', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'NEERAJ KUMAR' LIMIT 1;
    END IF;
        
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'idfc', 0, 3) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'bob', 18, 39) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'au', 0, 3) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'idfc', 3, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'bob', 39, 45) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'au', 3, 3) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'bob', 45, 89) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'rbl', 0, 2) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'au', 3, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'bob', 89, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'rbl', 2, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('RAVI DUBEY', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'RAVI DUBEY' LIMIT 1;
    END IF;
        

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('NARENDRA', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'NARENDRA' LIMIT 1;
    END IF;
        

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('JAI JAGANNATH CARDS SERVICES PRIVATE LIMITED', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'JAI JAGANNATH CARDS SERVICES PRIVATE LIMITED' LIMIT 1;
    END IF;
        
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'tata_neu', 27, 9) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'bob', 3, 66) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'tata_neu', 9, 11) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'bob', 66, 158) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'hdfc', 0, 10) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'tata_neu', 11, 14) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'bob', 158, 251) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'hdfc', 10, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'tata_neu', 14, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'bob', 251, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('RIYA', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'RIYA' LIMIT 1;
    END IF;
        
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'sbi', 0, 10) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'sbi', 10, 13) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'sbi', 13, 8) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'sbi', 8, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('RITIK', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'RITIK' LIMIT 1;
    END IF;
        

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('MANTU RAJPUT', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'MANTU RAJPUT' LIMIT 1;
    END IF;
        

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('CHETAN', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'CHETAN' LIMIT 1;
    END IF;
        

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('SHILPA', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'SHILPA' LIMIT 1;
    END IF;
        
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'au', 1, 1) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'axis', 2, 4) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'hdfc', 0, 1) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'idfc', 4, 6) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'sbi', 0, 1) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'bob', 7, 32) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'yes_zaggle', 26, 6) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'au', 1, 1) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'axis', 4, 2) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'hdfc', 1, 3) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'idfc', 6, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'sbi', 1, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'bob', 32, 13) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'yes_zaggle', 6, 2) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'icici', 0, 1) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'au', 1, 1) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'axis', 2, 13) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'hdfc', 3, 7) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'bob', 13, 25) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'yes_zaggle', 2, 5) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'au', 1, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'axis', 13, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'hdfc', 7, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'bob', 25, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'yes_zaggle', 5, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('SANJAY PATEL', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'SANJAY PATEL' LIMIT 1;
    END IF;
        
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'idfc', 1, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'bob', 15, 3) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'bob', 3, 64) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'axis', 0, 3) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'bob', 64, 32) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'axis', 3, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'bob', 32, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('SNEHA SHARMA', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'SNEHA SHARMA' LIMIT 1;
    END IF;
        
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'au', 5, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'axis', 5, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'hdfc', 4, 1) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'idfc', 7, 8) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'indus', 2, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'sbi', 13, 11) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'yes_zaggle', 2, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'axis_lic', 0, 1) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'hdfc', 1, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'idfc', 8, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'sbi', 11, 1) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'axis_lic', 1, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'sbi', 1, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'bob', 0, 139) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'bob', 139, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('ANJANI PANDEY', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'ANJANI PANDEY' LIMIT 1;
    END IF;
        
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'bob', 0, 2) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'bob', 2, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('AED19 CARD SERVICES PVT LTD', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'AED19 CARD SERVICES PVT LTD' LIMIT 1;
    END IF;
        
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'bob', 0, 1) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'bob', 1, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('PRUDENTS', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'PRUDENTS' LIMIT 1;
    END IF;
        
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'bob', 0, 1) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'bob', 1, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('SHIVANSHIENTERPRISES', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'SHIVANSHIENTERPRISES' LIMIT 1;
    END IF;
        
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'hdfc', 0, 4) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'hdfc', 4, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('SUNIL', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'SUNIL' LIMIT 1;
    END IF;
        
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'hdfc', 0, 14) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'tata_neu', 0, 2) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'hdfc', 14, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'tata_neu', 2, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;

    -- Manager: ZEESHAN HAIDER
    SELECT id INTO v_mgr FROM managers WHERE name = 'ZEESHAN HAIDER' LIMIT 1;

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('ATUL', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'ATUL' LIMIT 1;
    END IF;
        

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('ZEESHAN', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'ZEESHAN' LIMIT 1;
    END IF;
        
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'bob', 91, 79) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'bob', 79, 99) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'bob', 99, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('AFSANA BEGUM', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'AFSANA BEGUM' LIMIT 1;
    END IF;
        
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'hdfc', 0, 1) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'hdfc', 1, 4) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('ADVENTURIA THRILL INDIA PRIVATE LIMITED', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'ADVENTURIA THRILL INDIA PRIVATE LIMITED' LIMIT 1;
    END IF;
        
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'idfc', 4, 2) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'bob', 80, 80) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'yes_zaggle', 12, 5) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'idfc', 2, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'bob', 80, 96) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'yes_zaggle', 5, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'bob', 96, 147) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'yes_zaggle', 0, 1) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'rbl', 0, 3) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'bob', 147, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'yes_zaggle', 1, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'rbl', 3, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('CREDITLO BUSINESS SOLUTIONS', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'CREDITLO BUSINESS SOLUTIONS' LIMIT 1;
    END IF;
        
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'idfc', 0, 1) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'bob', 0, 6) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'idfc', 1, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'tata_neu', 0, 6) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'bob', 6, 5) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'tata_neu', 6, 20) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'bob', 5, 5) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'tata_neu', 20, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'bob', 5, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('SALEEM', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'SALEEM' LIMIT 1;
    END IF;
        
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'tata_neu', 854, 998) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'hdfc', 0, 204) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'tata_neu', 998, 464) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'hdfc', 204, 885) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'tata_neu', 464, 918) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'hdfc', 885, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'tata_neu', 918, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('GAGAN', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'GAGAN' LIMIT 1;
    END IF;
        

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('CREDBAE', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'CREDBAE' LIMIT 1;
    END IF;
        
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'axis', 1, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'idfc', 43, 20) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'bob', 0, 3) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'yes_zaggle', 5, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'axis', 0, 1) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'hdfc', 0, 1) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'idfc', 20, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'bob', 3, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'axis', 1, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'hdfc', 1, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'bob', 0, 1) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'bob', 1, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('LAKSHAY RATHORE', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'LAKSHAY RATHORE' LIMIT 1;
    END IF;
        
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'indus', 19, 18) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'yes_zaggle', 0, 1) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'indus', 18, 2) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'yes_zaggle', 1, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'indus', 2, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('SUBHASH', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'SUBHASH' LIMIT 1;
    END IF;
        

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('SATENDER', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'SATENDER' LIMIT 1;
    END IF;
        

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('I DOOR WEALTH MENAGMENT', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'I DOOR WEALTH MENAGMENT' LIMIT 1;
    END IF;
        
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'axis', 13, 2) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'axis', 2, 4) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'tata_neu', 0, 2) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'axis', 4, 11) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'hdfc', 0, 2) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'sbi', 0, 3) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'tata_neu', 2, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'axis', 11, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'hdfc', 2, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'sbi', 3, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('ASHISH', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'ASHISH' LIMIT 1;
    END IF;
        

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('GB ENTERPRISE', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'GB ENTERPRISE' LIMIT 1;
    END IF;
        
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'bob', 1, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'bob', 0, 2) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'bob', 2, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('NITIN', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'NITIN' LIMIT 1;
    END IF;
        

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('MANISH', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'MANISH' LIMIT 1;
    END IF;
        

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('ETER', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'ETER' LIMIT 1;
    END IF;
        

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('FARHAD', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'FARHAD' LIMIT 1;
    END IF;
        
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'hdfc', 1, 1) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'hdfc', 1, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('SOHRAB', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'SOHRAB' LIMIT 1;
    END IF;
        
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'idfc', 0, 9) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'idfc', 9, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('SUMIT Z', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'SUMIT Z' LIMIT 1;
    END IF;
        

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('AMIRUL', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'AMIRUL' LIMIT 1;
    END IF;
        
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'bob', 4, 1) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'bob', 1, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('SAIFUDDIN', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'SAIFUDDIN' LIMIT 1;
    END IF;
        

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('D FINCARD', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'D FINCARD' LIMIT 1;
    END IF;
        

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('ASCENT', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'ASCENT' LIMIT 1;
    END IF;
        

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('TELERING PROCESS PVT LTD( AKASH)', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'TELERING PROCESS PVT LTD( AKASH)' LIMIT 1;
    END IF;
        
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'axis', 5, 2) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'axis_lic', 1, 1) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'hdfc', 32, 28) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'idfc', 15, 10) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'indus', 0, 11) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'sbi', 3, 4) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'yes_zaggle', 18, 9) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('RAHUL K', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'RAHUL K' LIMIT 1;
    END IF;
        

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('GULREZ', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'GULREZ' LIMIT 1;
    END IF;
        
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'hdfc', 0, 5) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'hdfc', 5, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('TELERING PROCESS PVT LTD', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'TELERING PROCESS PVT LTD' LIMIT 1;
    END IF;
        
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'axis', 2, 10) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'axis_lic', 1, 3) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'hdfc', 28, 8) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'idfc', 10, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'indus', 11, 10) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'sbi', 4, 3) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'tata_neu', 0, 594) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'bob', 0, 7) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'yes_zaggle', 9, 5) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'axis', 10, 15) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'axis_lic', 3, 2) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'hdfc', 8, 26) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'indus', 10, 4) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'sbi', 3, 6) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'tata_neu', 594, 188) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'bob', 7, 276) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'yes_zaggle', 5, 11) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'rbl', 0, 26) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'axis', 15, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'axis_lic', 2, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'hdfc', 26, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'indus', 4, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'sbi', 6, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'tata_neu', 188, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'bob', 276, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'yes_zaggle', 11, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'rbl', 26, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('EXTRA', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'EXTRA' LIMIT 1;
    END IF;
        

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('AFSANA BEGUM/AMIRUL', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'AFSANA BEGUM/AMIRUL' LIMIT 1;
    END IF;
        
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'axis', 0, 3) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'hdfc', 4, 26) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'bob', 0, 4) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'axis', 3, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'hdfc', 26, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'bob', 4, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('BHUVNESH', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'BHUVNESH' LIMIT 1;
    END IF;
        
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'bob', 0, 10) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'bob', 10, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('SWATI (ZEESHAN)', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'SWATI (ZEESHAN)' LIMIT 1;
    END IF;
        
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'bob', 0, 2) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'bob', 2, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;

    -- Manager: BINOD MISHRA
    SELECT id INTO v_mgr FROM managers WHERE name = 'BINOD MISHRA' LIMIT 1;

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('BISHAL PAUL', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'BISHAL PAUL' LIMIT 1;
    END IF;
        
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'axis', 3, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'hdfc', 18, 14) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'bob', 27, 32) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'hdfc', 14, 10) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'bob', 32, 50) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'yes_zaggle', 0, 2) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'hdfc', 10, 2) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'bob', 50, 1) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'yes_zaggle', 2, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'hdfc', 2, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'bob', 1, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('ABHIPAY', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'ABHIPAY' LIMIT 1;
    END IF;
        
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'axis', 77, 2) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'hdfc', 1, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'tata_neu', 0, 58) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'bob', 31, 7) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'axis', 3, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'tata_neu', 58, 145) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'bob', 7, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'tata_neu', 145, 425) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'bob', 0, 1) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'tata_neu', 425, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'bob', 1, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('PROSENJIT CHATERJEE', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'PROSENJIT CHATERJEE' LIMIT 1;
    END IF;
        
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'axis', 17, 1) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'idfc', 21, 13) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'indus', 7, 3) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'bob', 50, 39) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'yes_zaggle', 4, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'axis', 1, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'idfc', 13, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'indus', 3, 2) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'tata_neu', 0, 5) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'bob', 39, 91) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'yes_zaggle', 0, 2) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'hdfc', 0, 3) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'indus', 2, 1) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'tata_neu', 5, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'bob', 91, 180) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'yes_zaggle', 2, 2) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'rbl', 0, 14) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'hdfc', 3, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'indus', 1, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'bob', 180, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'yes_zaggle', 2, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'rbl', 14, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('UDYAAM', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'UDYAAM' LIMIT 1;
    END IF;
        
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'bob', 3, 1) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('SUDIP POUL', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'SUDIP POUL' LIMIT 1;
    END IF;
        
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'axis', 46, 44) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'hdfc', 5, 4) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'idfc', 8, 6) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'indus', 0, 1) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'bob', 31, 17) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'yes_zaggle', 23, 8) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'axis', 44, 17) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'hdfc', 4, 1) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'idfc', 6, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'indus', 1, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'bob', 17, 19) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'yes_zaggle', 8, 2) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'au', 0, 10) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'axis', 17, 23) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'hdfc', 1, 4) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'bob', 19, 48) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'yes_zaggle', 2, 3) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'rbl', 0, 11) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'au', 10, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'axis', 23, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'hdfc', 4, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'bob', 48, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'yes_zaggle', 3, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'rbl', 11, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('RR ASSOCIATES', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'RR ASSOCIATES' LIMIT 1;
    END IF;
        
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'au', 0, 8) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'axis', 26, 19) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'hdfc', 6, 8) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'idfc', 92, 55) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'indus', 1, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'sbi', 2, 2) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'bob', 28, 28) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'yes_zaggle', 17, 7) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'au', 8, 35) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'axis', 15, 13) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'hdfc', 8, 11) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'idfc', 55, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'indus', 0, 6) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'sbi', 2, 1) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'tata_neu', 0, 83) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'bob', 28, 18) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'yes_zaggle', 7, 2) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'au', 35, 40) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'axis', 13, 16) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'hdfc', 13, 14) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'indus', 6, 7) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'sbi', 1, 5) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'tata_neu', 83, 19) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'bob', 19, 53) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'yes_zaggle', 2, 3) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'rbl', 0, 9) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'au', 40, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'axis', 16, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'hdfc', 14, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'indus', 7, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'sbi', 5, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'tata_neu', 19, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'bob', 53, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'yes_zaggle', 3, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'rbl', 9, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('SRABANTI PAUL', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'SRABANTI PAUL' LIMIT 1;
    END IF;
        
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'axis', 7, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'hdfc', 1, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'bob', 21, 18) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'yes_zaggle', 4, 1) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'axis', 0, 9) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'hdfc', 0, 2) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'tata_neu', 0, 5) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'bob', 18, 45) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'yes_zaggle', 1, 1) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'axis', 9, 16) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'hdfc', 2, 7) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'tata_neu', 5, 3) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'bob', 45, 46) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'yes_zaggle', 1, 1) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'axis', 16, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'hdfc', 7, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'tata_neu', 3, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'bob', 46, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'yes_zaggle', 1, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('PARTHO BHATACHARJEE', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'PARTHO BHATACHARJEE' LIMIT 1;
    END IF;
        
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'axis', 16, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'hdfc', 15, 4) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'idfc', 4, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'indus', 1, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'bob', 11, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'hdfc', 4, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('S K RABI', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'S K RABI' LIMIT 1;
    END IF;
        
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'idfc', 8, 4) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'bob', 0, 16) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'bob', 16, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('SECUREPEAK SERVICE PVT LTD', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'SECUREPEAK SERVICE PVT LTD' LIMIT 1;
    END IF;
        
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'axis', 2, 1) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'hdfc', 11, 14) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'idfc', 47, 48) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'bob', 7, 11) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'yes_zaggle', 62, 39) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'au', 0, 1) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'axis', 1, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'hdfc', 14, 6) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'idfc', 48, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'tata_neu', 0, 10) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'bob', 11, 11) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'yes_zaggle', 39, 11) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'au', 1, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'axis', 0, 1) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'hdfc', 6, 2) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'tata_neu', 10, 8) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'bob', 11, 23) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'yes_zaggle', 11, 30) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'rbl', 0, 24) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'axis', 1, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'hdfc', 2, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'tata_neu', 8, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'bob', 23, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'yes_zaggle', 30, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'rbl', 24, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('AVIK SAHA', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'AVIK SAHA' LIMIT 1;
    END IF;
        
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'au', 1, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'hdfc', 18, 7) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'idfc', 2, 2) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'bob', 7, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'yes_zaggle', 4, 1) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('ABHISHEK SHARMA', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'ABHISHEK SHARMA' LIMIT 1;
    END IF;
        
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'axis', 5, 4) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'hdfc', 5, 8) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'idfc', 2, 1) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('MADHABI SHOW', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'MADHABI SHOW' LIMIT 1;
    END IF;
        
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'axis', 8, 1) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'hdfc', 44, 21) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'bob', 7, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'axis', 1, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'hdfc', 21, 2) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'bob', 0, 1) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('GROWUP FINANCIAL', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'GROWUP FINANCIAL' LIMIT 1;
    END IF;
        
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'axis', 0, 1) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'tata_neu', 0, 1) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'axis', 1, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'tata_neu', 1, 1) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'tata_neu', 1, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('FUNDCAP', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'FUNDCAP' LIMIT 1;
    END IF;
        
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'axis', 0, 1) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'bob', 0, 12) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'axis', 1, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'bob', 12, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('PARTHA BHATTACHARJEE', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'PARTHA BHATTACHARJEE' LIMIT 1;
    END IF;
        
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'tata_neu', 0, 1) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'tata_neu', 1, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;

    -- Manager: DIVYAM
    SELECT id INTO v_mgr FROM managers WHERE name = 'DIVYAM' LIMIT 1;

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('AMIT KUMAR', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'AMIT KUMAR' LIMIT 1;
    END IF;
        
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'axis', 0, 3) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'bob', 2, 3) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('ATIK AHMED', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'ATIK AHMED' LIMIT 1;
    END IF;
        
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'au', 0, 2) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'axis', 1, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'hdfc', 1, 5) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'sbi', 20, 5) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'kiwi', 0, 1) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'bob', 0, 3) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'au', 2, 2) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'hdfc', 5, 8) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'indus', 0, 2) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'sbi', 5, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'kiwi', 1, 1) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'bob', 1, 3) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'au', 2, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'hdfc', 8, 4) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'indus', 2, 6) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'sbi', 0, 3) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'kiwi', 1, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'bob', 3, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'hdfc', 4, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'indus', 6, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'sbi', 3, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('CRED BAZAR', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'CRED BAZAR' LIMIT 1;
    END IF;
        
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'bob', 7, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('OWLOTS NEXTGEN PRIVATE LIMITED', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'OWLOTS NEXTGEN PRIVATE LIMITED' LIMIT 1;
    END IF;
        
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'sbi', 4, 3) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'bob', 18, 32) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'indus', 0, 12) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'sbi', 3, 3) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'bob', 32, 61) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'indus', 12, 4) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'sbi', 3, 4) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'bob', 61, 140) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'indus', 4, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'sbi', 4, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'bob', 140, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('VIKASH SHARMA', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'VIKASH SHARMA' LIMIT 1;
    END IF;
        
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'axis', 1, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('JASWANT SINGH', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'JASWANT SINGH' LIMIT 1;
    END IF;
        

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('KAMLAKAR', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'KAMLAKAR' LIMIT 1;
    END IF;
        
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'hdfc', 0, 1) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'hdfc', 1, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('FAIZAL', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'FAIZAL' LIMIT 1;
    END IF;
        
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'axis', 4, 3) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'hdfc', 6, 4) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'sbi', 61, 78) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'axis', 3, 2) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'hdfc', 4, 2) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'indus', 0, 1) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'sbi', 78, 110) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'axis', 2, 7) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'hdfc', 2, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'indus', 1, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'sbi', 110, 121) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'axis', 7, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'sbi', 121, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('BHASKAR CHATTERJEE', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'BHASKAR CHATTERJEE' LIMIT 1;
    END IF;
        

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('VIKRAM PUNE', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'VIKRAM PUNE' LIMIT 1;
    END IF;
        
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'tata_neu', 222, 324) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'tata_neu', 324, 20) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'tata_neu', 20, 4) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'tata_neu', 4, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('SAFIYAR', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'SAFIYAR' LIMIT 1;
    END IF;
        

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('ATUL PATEL', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'ATUL PATEL' LIMIT 1;
    END IF;
        

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('KUNAL MODI', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'KUNAL MODI' LIMIT 1;
    END IF;
        

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('INDERJEET KOYLE', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'INDERJEET KOYLE' LIMIT 1;
    END IF;
        

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('INTROSPECT FINANCIAL SERVICE', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'INTROSPECT FINANCIAL SERVICE' LIMIT 1;
    END IF;
        
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'hdfc', 8, 10) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'indus', 0, 1) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'sbi', 2, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'hdfc', 10, 14) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'indus', 1, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'hdfc', 14, 32) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'hdfc', 32, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('VIKAS D', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'VIKAS D' LIMIT 1;
    END IF;
        
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'hdfc', 0, 2) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'yes_zaggle', 1, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'hdfc', 2, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'yes_zaggle', 0, 1) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'bob', 0, 1) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'yes_zaggle', 1, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'bob', 1, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('VIKAS BHADORIA', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'VIKAS BHADORIA' LIMIT 1;
    END IF;
        
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'hdfc', 2, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'tata_neu', 5, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'kiwi', 1, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('RAJI BALI', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'RAJI BALI' LIMIT 1;
    END IF;
        
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'idfc', 2, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('KAJAL', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'KAJAL' LIMIT 1;
    END IF;
        

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('PRIYANKA BASAI', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'PRIYANKA BASAI' LIMIT 1;
    END IF;
        

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('KHALID SHAIKH', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'KHALID SHAIKH' LIMIT 1;
    END IF;
        
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'yes_zaggle', 1, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('BHAVESH', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'BHAVESH' LIMIT 1;
    END IF;
        

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('MESHIYA HETALBEN TARUNKUMAR', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'MESHIYA HETALBEN TARUNKUMAR' LIMIT 1;
    END IF;
        
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'sbi', 0, 4) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'bob', 0, 2) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'sbi', 4, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'bob', 2, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'bob', 0, 11) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'bob', 11, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('MILI PRADHAN', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'MILI PRADHAN' LIMIT 1;
    END IF;
        
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'au', 0, 1) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'axis_lic', 1, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'hdfc', 2, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'indus', 2, 2) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'bob', 9, 23) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'au', 1, 1) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'axis', 0, 1) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'hdfc', 0, 2) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'indus', 2, 2) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'bob', 23, 8) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'au', 1, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'axis', 1, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'hdfc', 2, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'indus', 2, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'bob', 8, 1) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'bob', 1, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('PAPPU PAL', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'PAPPU PAL' LIMIT 1;
    END IF;
        

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('ARPIT', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'ARPIT' LIMIT 1;
    END IF;
        

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('VISHAL RAVAT', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'VISHAL RAVAT' LIMIT 1;
    END IF;
        

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('SURESH', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'SURESH' LIMIT 1;
    END IF;
        
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'sbi', 1, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('UPENDRA KODESA', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'UPENDRA KODESA' LIMIT 1;
    END IF;
        
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'axis', 1, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'indus', 1, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('ANSH MANAGEMENT', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'ANSH MANAGEMENT' LIMIT 1;
    END IF;
        
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'hdfc', 46, 16) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'hdfc', 16, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('HETAL', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'HETAL' LIMIT 1;
    END IF;
        
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'sbi', 0, 9) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'sbi', 9, 11) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'sbi', 11, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('GAJENDRA', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'GAJENDRA' LIMIT 1;
    END IF;
        
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'tata_neu', 0, 279) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'tata_neu', 279, 521) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'tata_neu', 521, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('ABHISHEK', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'ABHISHEK' LIMIT 1;
    END IF;
        
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'hdfc', 0, 3) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'hdfc', 3, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('ASHISH JANI', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'ASHISH JANI' LIMIT 1;
    END IF;
        
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'au', 0, 1) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'au', 1, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;

    -- Manager: VINAY PANDEY
    SELECT id INTO v_mgr FROM managers WHERE name = 'VINAY PANDEY' LIMIT 1;

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('SWATI', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'SWATI' LIMIT 1;
    END IF;
        
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'sbi', 34, 15) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'sbi', 15, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'sbi', 0, 1) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'sbi', 1, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('VINEET SHARMA', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'VINEET SHARMA' LIMIT 1;
    END IF;
        
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'hdfc', 1, 10) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'sbi', 31, 24) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'bob', 0, 1) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'hdfc', 10, 1) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'sbi', 24, 3) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'bob', 1, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'hdfc', 1, 3) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'sbi', 3, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'bob', 0, 4) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'hdfc', 3, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'bob', 4, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('ADITYA PRATAP', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'ADITYA PRATAP' LIMIT 1;
    END IF;
        

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('RIDHVIK FINANCIAL SERVICES', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'RIDHVIK FINANCIAL SERVICES' LIMIT 1;
    END IF;
        
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'idfc', 53, 35) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'indus', 9, 6) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'tata_neu', 1, 8) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'kiwi', 1, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'bob', 35, 45) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'idfc', 35, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'indus', 6, 8) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'tata_neu', 8, 36) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'bob', 45, 69) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'axis', 0, 3) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'indus', 8, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'tata_neu', 36, 18) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'bob', 69, 272) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'axis', 3, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'tata_neu', 18, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'bob', 272, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('ANJALI CHAWLA', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'ANJALI CHAWLA' LIMIT 1;
    END IF;
        

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('ABHISHEK DUTTA', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'ABHISHEK DUTTA' LIMIT 1;
    END IF;
        
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'indus', 7, 8) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'indus', 8, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'indus', 0, 2) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'indus', 2, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('FARMAN', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'FARMAN' LIMIT 1;
    END IF;
        
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'hdfc', 6, 8) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'sbi', 30, 20) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'hdfc', 6, 7) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'sbi', 20, 12) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'hdfc', 7, 12) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'sbi', 12, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'tata_neu', 0, 2) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'hdfc', 12, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'tata_neu', 2, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('SHREE SHYAM SOLUTION', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'SHREE SHYAM SOLUTION' LIMIT 1;
    END IF;
        

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('SUNITA (BOOSTER SCORE SOLUTIONS PVT LTD)', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'SUNITA (BOOSTER SCORE SOLUTIONS PVT LTD)' LIMIT 1;
    END IF;
        
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'axis', 0, 6) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'hdfc', 55, 41) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'tata_neu', 1, 131) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'axis', 6, 11) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'hdfc', 41, 33) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'indus', 0, 1) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'tata_neu', 131, 198) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'axis', 11, 10) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'hdfc', 33, 55) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'indus', 1, 1) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'tata_neu', 198, 119) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'rbl', 0, 2) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'axis', 10, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'hdfc', 55, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'indus', 1, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'tata_neu', 119, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'rbl', 2, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('DEEPU RAJPUT', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'DEEPU RAJPUT' LIMIT 1;
    END IF;
        

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('ARPAN TYAGI', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'ARPAN TYAGI' LIMIT 1;
    END IF;
        
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'sbi', 7, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'sbi', 0, 6) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'sbi', 6, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('ANSHUL CHHIMWAL', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'ANSHUL CHHIMWAL' LIMIT 1;
    END IF;
        

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('INTERNITY PVT LTD', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'INTERNITY PVT LTD' LIMIT 1;
    END IF;
        
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'sbi', 130, 99) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('ANUBHAV GUPTA', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'ANUBHAV GUPTA' LIMIT 1;
    END IF;
        
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'hdfc', 11, 4) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'sbi', 127, 172) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'hdfc', 4, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'sbi', 172, 98) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'hdfc', 0, 17) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'sbi', 98, 61) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'hdfc', 17, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'sbi', 61, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('FINSPARK', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'FINSPARK' LIMIT 1;
    END IF;
        
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'sbi', 19, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('GENEX', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'GENEX' LIMIT 1;
    END IF;
        

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('PRIYA CHAND', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'PRIYA CHAND' LIMIT 1;
    END IF;
        
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'indus', 0, 4) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'indus', 4, 2) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'indus', 2, 1) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'indus', 1, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('MD WASIN', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'MD WASIN' LIMIT 1;
    END IF;
        

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('ARUN KUMAR', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'ARUN KUMAR' LIMIT 1;
    END IF;
        
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'sbi', 103, 100) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'sbi', 100, 88) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'axis', 0, 11) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'sbi', 88, 71) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'axis', 11, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'sbi', 71, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('ARMAN RANJAN', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'ARMAN RANJAN' LIMIT 1;
    END IF;
        
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'sbi', 9, 17) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'sbi', 17, 7) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'sbi', 7, 10) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'sbi', 10, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('BHARAT ENTERPRISES (PATHWAY SOLUTION)', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'BHARAT ENTERPRISES (PATHWAY SOLUTION)' LIMIT 1;
    END IF;
        
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'axis_lic', 1, 8) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'hdfc', 16, 8) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'idfc', 225, 188) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'indus', 13, 5) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'sbi', 189, 259) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'tata_neu', 3, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'bob', 28, 82) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'yes_zaggle', 1, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'axis_lic', 8, 12) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'hdfc', 8, 8) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'idfc', 188, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'indus', 4, 3) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'sbi', 259, 170) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'tata_neu', 0, 2) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'bob', 82, 27) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'axis', 0, 33) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'axis_lic', 12, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'hdfc', 8, 94) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'indus', 3, 7) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'sbi', 170, 145) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'tata_neu', 2, 2) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'bob', 27, 112) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'axis', 33, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'hdfc', 94, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'indus', 7, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'sbi', 145, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'tata_neu', 2, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'bob', 112, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('CAPITAL CALL SERVICE', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'CAPITAL CALL SERVICE' LIMIT 1;
    END IF;
        
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'indus', 0, 10) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'indus', 10, 2) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'indus', 2, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('CARD EXPERTISE', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'CARD EXPERTISE' LIMIT 1;
    END IF;
        

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('CARDS EXPERTS', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'CARDS EXPERTS' LIMIT 1;
    END IF;
        
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'hdfc', 0, 7) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'indus', 15, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'sbi', 18, 8) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'tata_neu', 10, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'hdfc', 7, 7) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'sbi', 4, 12) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'axis', 0, 66) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'hdfc', 7, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'sbi', 12, 25) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'bob', 0, 2) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'axis', 66, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'sbi', 25, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'bob', 2, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('DEBSTER MEDIA PRIVATE LIMITED', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'DEBSTER MEDIA PRIVATE LIMITED' LIMIT 1;
    END IF;
        
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'idfc', 1, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'indus', 44, 26) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'yes_zaggle', 1, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'indus', 26, 3) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'indus', 3, 3) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'indus', 3, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('GREAT INDIA COMMUNICATIONS', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'GREAT INDIA COMMUNICATIONS' LIMIT 1;
    END IF;
        

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('SNEHALATA/VINAY', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'SNEHALATA/VINAY' LIMIT 1;
    END IF;
        

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('K S CARDS', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'K S CARDS' LIMIT 1;
    END IF;
        
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'indus', 0, 2) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'indus', 2, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('NAINSHU/VINAY', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'NAINSHU/VINAY' LIMIT 1;
    END IF;
        
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'sbi', 17, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('SATYAWAN/VILAS', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'SATYAWAN/VILAS' LIMIT 1;
    END IF;
        
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'sbi', 8, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('KHUSHBOO SINGH', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'KHUSHBOO SINGH' LIMIT 1;
    END IF;
        
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'sbi', 23, 5) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'sbi', 5, 50) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'indus', 0, 1) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'sbi', 50, 14) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'indus', 1, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'sbi', 14, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('AMIT KUMAR SHARMA', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'AMIT KUMAR SHARMA' LIMIT 1;
    END IF;
        
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'idfc', 5, 6) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'bob', 7, 94) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'idfc', 6, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'bob', 94, 120) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'bob', 120, 87) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'bob', 87, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('MONEY MART', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'MONEY MART' LIMIT 1;
    END IF;
        
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'idfc', 4, 4) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'bob', 0, 3) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'idfc', 4, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'bob', 3, 7) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'bob', 7, 12) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'bob', 12, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('NEHA SAINI', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'NEHA SAINI' LIMIT 1;
    END IF;
        
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'sbi', 30, 106) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'sbi', 106, 16) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'sbi', 16, 18) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'sbi', 18, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('SHAILENDRA PANDEY', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'SHAILENDRA PANDEY' LIMIT 1;
    END IF;
        

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('SHAHA ZAIDI', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'SHAHA ZAIDI' LIMIT 1;
    END IF;
        

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('RKP96 CARDS SOLUTION PVT LTD', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'RKP96 CARDS SOLUTION PVT LTD' LIMIT 1;
    END IF;
        

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('S & P FINANCIAL SOLUTIONS', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'S & P FINANCIAL SOLUTIONS' LIMIT 1;
    END IF;
        
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'au', 1, 2) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'idfc', 4, 2) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'indus', 0, 1) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'sbi', 7, 14) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'bob', 52, 55) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'au', 2, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'hdfc', 0, 3) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'idfc', 2, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'indus', 1, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'sbi', 14, 8) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'bob', 55, 40) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'axis', 0, 4) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'hdfc', 3, 8) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'sbi', 8, 15) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'tata_neu', 0, 1) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'bob', 40, 40) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'axis', 4, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'hdfc', 8, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'sbi', 15, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'tata_neu', 1, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'bob', 40, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('SAMEER', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'SAMEER' LIMIT 1;
    END IF;
        

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('SUKRITI MANDAL', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'SUKRITI MANDAL' LIMIT 1;
    END IF;
        
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'sbi', 79, 109) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'sbi', 109, 76) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'sbi', 76, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('SANJAY SAINI', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'SANJAY SAINI' LIMIT 1;
    END IF;
        
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'axis', 2, 9) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'hdfc', 7, 14) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'idfc', 1, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'indus', 5, 4) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'sbi', 8, 11) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'kiwi', 1, 1) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'bob', 10, 6) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'axis', 9, 19) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'hdfc', 14, 12) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'indus', 4, 4) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'sbi', 11, 9) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'kiwi', 1, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'bob', 6, 14) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'au', 0, 1) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'axis', 19, 20) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'hdfc', 12, 13) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'indus', 4, 1) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'sbi', 9, 10) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'bob', 14, 6) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'au', 1, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'axis', 20, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'hdfc', 13, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'indus', 1, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'sbi', 10, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'bob', 6, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('MD ATIF', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'MD ATIF' LIMIT 1;
    END IF;
        

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('POOJA GUPTA', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'POOJA GUPTA' LIMIT 1;
    END IF;
        

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('TEJPAL SINGH', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'TEJPAL SINGH' LIMIT 1;
    END IF;
        
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'au', 1, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'axis', 3, 1) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'axis_lic', 1, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'hdfc', 11, 2) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'idfc', 10, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'sbi', 16, 12) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'bob', 4, 1) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'axis', 1, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'hdfc', 2, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'sbi', 12, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'bob', 1, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('MANOJ', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'MANOJ' LIMIT 1;
    END IF;
        

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('SKY HEIGHTS OUTSOURCING SOLUTIONS', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'SKY HEIGHTS OUTSOURCING SOLUTIONS' LIMIT 1;
    END IF;
        
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'hdfc', 120, 174) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'idfc', 6, 4) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'tata_neu', 54, 36) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'hdfc', 176, 86) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'idfc', 4, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'tata_neu', 36, 25) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'hdfc', 86, 92) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'tata_neu', 25, 69) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'hdfc', 92, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'tata_neu', 69, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('PREETAM', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'PREETAM' LIMIT 1;
    END IF;
        
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'bob', 0, 3) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'bob', 3, 4) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'bob', 4, 13) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'bob', 13, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('RN CARD EXPERTISE PRIVATE LIMITED', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'RN CARD EXPERTISE PRIVATE LIMITED' LIMIT 1;
    END IF;
        
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'idfc', 132, 74) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'sbi', 211, 167) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'idfc', 74, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'sbi', 167, 113) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'sbi', 113, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('ZAHID', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'ZAHID' LIMIT 1;
    END IF;
        
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'sbi', 0, 28) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'sbi', 28, 38) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'sbi', 38, 18) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'sbi', 18, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('VIKAS', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'VIKAS' LIMIT 1;
    END IF;
        
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'sbi', 67, 30) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'sbi', 30, 140) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'sbi', 140, 7) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'sbi', 7, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('VARSHA RANI', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'VARSHA RANI' LIMIT 1;
    END IF;
        
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'indus', 0, 2) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'sbi', 0, 8) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'bob', 6, 10) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'indus', 2, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'sbi', 5, 3) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'bob', 10, 45) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'sbi', 3, 1) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'bob', 45, 43) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'sbi', 1, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'bob', 43, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('SANTOSH KUMAR SHARMA', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'SANTOSH KUMAR SHARMA' LIMIT 1;
    END IF;
        
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'bob', 2, 3) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'tata_neu', 0, 2) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'bob', 3, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'tata_neu', 2, 3) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'bob', 0, 18) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'tata_neu', 3, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'bob', 18, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('SHRESHREY CARD SERVICES PRIVATE LIMITED', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'SHRESHREY CARD SERVICES PRIVATE LIMITED' LIMIT 1;
    END IF;
        
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'axis', 66, 2) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'yes_zaggle', 153, 195) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'axis', 2, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'yes_zaggle', 195, 6) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'yes_zaggle', 6, 30) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'yes_zaggle', 30, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('UMA SINGH ( SHIVI CARDS SERVICES)', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'UMA SINGH ( SHIVI CARDS SERVICES)' LIMIT 1;
    END IF;
        
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'au', 1, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'axis', 11, 15) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'indus', 0, 3) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'bob', 1, 19) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'axis', 15, 14) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'indus', 3, 5) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'bob', 19, 100) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'axis', 14, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'indus', 5, 2) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'sbi', 0, 1) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'bob', 100, 261) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'rbl', 0, 10) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'indus', 2, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'sbi', 1, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'bob', 261, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'rbl', 10, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('RUPI BAZAAR FINTECH PVT LTD', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'RUPI BAZAAR FINTECH PVT LTD' LIMIT 1;
    END IF;
        
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'indus', 9, 18) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'indus', 19, 4) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'indus', 4, 5) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'indus', 5, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('INTERNITY', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'INTERNITY' LIMIT 1;
    END IF;
        
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'sbi', 99, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('AKASH CHAUHAN', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'AKASH CHAUHAN' LIMIT 1;
    END IF;
        
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'sbi', 0, 73) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('AYUSH', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'AYUSH' LIMIT 1;
    END IF;
        
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'indus', 0, 5) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'indus', 5, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('KRISHNA', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'KRISHNA' LIMIT 1;
    END IF;
        
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'bob', 0, 9) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'bob', 9, 5) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'bob', 5, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('RAHUL', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'RAHUL' LIMIT 1;
    END IF;
        
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'sbi', 0, 1) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'axis', 0, 2) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'sbi', 1, 18) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'bob', 0, 5) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'axis', 2, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'sbi', 18, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'bob', 5, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('IMRAN', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'IMRAN' LIMIT 1;
    END IF;
        
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'indus', 0, 9) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'indus', 9, 4) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'indus', 4, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('AKSH CHOUHAN', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'AKSH CHOUHAN' LIMIT 1;
    END IF;
        
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'sbi', 73, 48) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'sbi', 48, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('UNIQE MONEY', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'UNIQE MONEY' LIMIT 1;
    END IF;
        
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'sbi', 0, 49) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'sbi', 49, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('SNEHLATA', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'SNEHLATA' LIMIT 1;
    END IF;
        
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'sbi', 0, 41) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'sbi', 41, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;

    -- Manager: ALKESH SHUKLA
    SELECT id INTO v_mgr FROM managers WHERE name = 'ALKESH SHUKLA' LIMIT 1;

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('ANKIT KHARE', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'ANKIT KHARE' LIMIT 1;
    END IF;
        

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('AMIT SINGH', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'AMIT SINGH' LIMIT 1;
    END IF;
        

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('IMAM ALI', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'IMAM ALI' LIMIT 1;
    END IF;
        

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('ABHISHEK CHANYAL', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'ABHISHEK CHANYAL' LIMIT 1;
    END IF;
        
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'hdfc', 5, 2) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'hdfc', 2, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'hdfc', 0, 13) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'tata_neu', 0, 5) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'bob', 0, 2) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'hdfc', 13, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'tata_neu', 5, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'bob', 2, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('JAIKESH SHUKLA', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'JAIKESH SHUKLA' LIMIT 1;
    END IF;
        

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('MADHU YADAV', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'MADHU YADAV' LIMIT 1;
    END IF;
        
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'hdfc', 0, 1) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'au', 0, 1) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'hdfc', 1, 2) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'au', 1, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'hdfc', 2, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('RITU SHUKLA', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'RITU SHUKLA' LIMIT 1;
    END IF;
        
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'axis', 4, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'hdfc', 31, 21) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'indus', 5, 5) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'sbi', 4, 2) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'hdfc', 21, 26) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'indus', 5, 2) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'sbi', 2, 3) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'hdfc', 26, 26) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'indus', 2, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'sbi', 3, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'tata_neu', 0, 1) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'bob', 0, 6) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'hdfc', 26, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'tata_neu', 1, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'bob', 6, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('ZAID ASKARI', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'ZAID ASKARI' LIMIT 1;
    END IF;
        

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('UPENDRA KUMAR SINGH', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'UPENDRA KUMAR SINGH' LIMIT 1;
    END IF;
        
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'axis', 0, 4) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'axis_lic', 1, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'axis', 4, 6) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'axis', 6, 1) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'axis', 1, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('VIJAY RASTOGI', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'VIJAY RASTOGI' LIMIT 1;
    END IF;
        
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'hdfc', 1, 1) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'hdfc', 1, 2) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'hdfc', 2, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('VIPIN KUMAR TIWARI', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'VIPIN KUMAR TIWARI' LIMIT 1;
    END IF;
        
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'hdfc', 34, 1) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'hdfc', 1, 35) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'hdfc', 35, 1) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'hdfc', 1, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;

    INSERT INTO channel_partners (name, manager_id)
    VALUES ('ZAINAB NADEEM', v_mgr)
    ON CONFLICT (name) DO UPDATE SET manager_id=v_mgr
    RETURNING id INTO v_cp;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'ZAINAB NADEEM' LIMIT 1;
    END IF;
        
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'hdfc', 0, 2) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'bob', 0, 1) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'hdfc', 2, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;
    INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'bob', 1, 0) ON CONFLICT (partner_id, bank_id, month_year) DO UPDATE SET lm_count=EXCLUDED.lm_count, cm_count=EXCLUDED.cm_count;

END $$;
