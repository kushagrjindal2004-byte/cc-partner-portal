-- ===========================================================================
-- COMPLETE SUPABASE SEED SCRIPT FOR JULY, AUGUST, SEPTEMBER, AND OCTOBER 2026
-- ===========================================================================

-- 1. Schema Safety Setup
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
ALTER TABLE managers ADD COLUMN IF NOT EXISTS pin_code TEXT DEFAULT '1234';
ALTER TABLE banks ADD COLUMN IF NOT EXISTS display_order INT DEFAULT 0;
ALTER TABLE channel_partners ADD COLUMN IF NOT EXISTS working_capital NUMERIC DEFAULT 0;

-- 2. Master Banks
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

-- 3. Monthly Cycles
INSERT INTO monthly_cycles (code, name, is_locked, prev_month_code) VALUES ('2026-07', 'July 2026', true, '2026-06') ON CONFLICT (code) DO UPDATE SET name=EXCLUDED.name, is_locked=EXCLUDED.is_locked, prev_month_code=EXCLUDED.prev_month_code;
INSERT INTO monthly_cycles (code, name, is_locked, prev_month_code) VALUES ('2026-08', 'August 2026', true, '2026-07') ON CONFLICT (code) DO UPDATE SET name=EXCLUDED.name, is_locked=EXCLUDED.is_locked, prev_month_code=EXCLUDED.prev_month_code;
INSERT INTO monthly_cycles (code, name, is_locked, prev_month_code) VALUES ('2026-09', 'September 2026', false, '2026-08') ON CONFLICT (code) DO UPDATE SET name=EXCLUDED.name, is_locked=EXCLUDED.is_locked, prev_month_code=EXCLUDED.prev_month_code;
INSERT INTO monthly_cycles (code, name, is_locked, prev_month_code) VALUES ('2026-10', 'October 2026', false, '2026-09') ON CONFLICT (code) DO UPDATE SET name=EXCLUDED.name, is_locked=EXCLUDED.is_locked, prev_month_code=EXCLUDED.prev_month_code;

-- 4. Managers, Channel Partners, and Card Issuances
DO $$
DECLARE
    v_mgr UUID;
    v_cp UUID;
    v_ci UUID;
BEGIN

    SELECT id INTO v_mgr FROM managers WHERE name = 'AZAM' LIMIT 1;
    IF v_mgr IS NULL THEN
        INSERT INTO managers (name, pin_code) VALUES ('AZAM', '1234') RETURNING id INTO v_mgr;
    ELSE
        UPDATE managers SET pin_code = '1234' WHERE id = v_mgr;
    END IF;
    

    SELECT id INTO v_mgr FROM managers WHERE name = 'INAYA' LIMIT 1;
    IF v_mgr IS NULL THEN
        INSERT INTO managers (name, pin_code) VALUES ('INAYA', '1234') RETURNING id INTO v_mgr;
    ELSE
        UPDATE managers SET pin_code = '1234' WHERE id = v_mgr;
    END IF;
    

    SELECT id INTO v_mgr FROM managers WHERE name = 'BHAVANI' LIMIT 1;
    IF v_mgr IS NULL THEN
        INSERT INTO managers (name, pin_code) VALUES ('BHAVANI', '1234') RETURNING id INTO v_mgr;
    ELSE
        UPDATE managers SET pin_code = '1234' WHERE id = v_mgr;
    END IF;
    

    SELECT id INTO v_mgr FROM managers WHERE name = 'BINOD MISHRA' LIMIT 1;
    IF v_mgr IS NULL THEN
        INSERT INTO managers (name, pin_code) VALUES ('BINOD MISHRA', '1234') RETURNING id INTO v_mgr;
    ELSE
        UPDATE managers SET pin_code = '1234' WHERE id = v_mgr;
    END IF;
    

    SELECT id INTO v_mgr FROM managers WHERE name = 'DIVYAM' LIMIT 1;
    IF v_mgr IS NULL THEN
        INSERT INTO managers (name, pin_code) VALUES ('DIVYAM', '1234') RETURNING id INTO v_mgr;
    ELSE
        UPDATE managers SET pin_code = '1234' WHERE id = v_mgr;
    END IF;
    

    SELECT id INTO v_mgr FROM managers WHERE name = 'VINAY PANDEY' LIMIT 1;
    IF v_mgr IS NULL THEN
        INSERT INTO managers (name, pin_code) VALUES ('VINAY PANDEY', '1234') RETURNING id INTO v_mgr;
    ELSE
        UPDATE managers SET pin_code = '1234' WHERE id = v_mgr;
    END IF;
    

    SELECT id INTO v_mgr FROM managers WHERE name = 'ALKESH SHUKLA' LIMIT 1;
    IF v_mgr IS NULL THEN
        INSERT INTO managers (name, pin_code) VALUES ('ALKESH SHUKLA', '1234') RETURNING id INTO v_mgr;
    ELSE
        UPDATE managers SET pin_code = '1234' WHERE id = v_mgr;
    END IF;
    

    SELECT id INTO v_mgr FROM managers WHERE name = 'ZEESHAN HAIDER' LIMIT 1;
    IF v_mgr IS NULL THEN
        INSERT INTO managers (name, pin_code) VALUES ('ZEESHAN HAIDER', '1234') RETURNING id INTO v_mgr;
    ELSE
        UPDATE managers SET pin_code = '1234' WHERE id = v_mgr;
    END IF;
    

    -- Manager: AZAM
    SELECT id INTO v_mgr FROM managers WHERE name = 'AZAM' LIMIT 1;

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'DALEE' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'DALEE' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('DALEE', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'hdfc' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'hdfc', 9, 8);
    ELSE
        UPDATE card_issuances SET lm_count = 9, cm_count = 8, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'tata_neu' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'tata_neu', 5, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 5, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'hdfc' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'hdfc', 8, 1);
    ELSE
        UPDATE card_issuances SET lm_count = 8, cm_count = 1, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'hdfc' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'hdfc', 1, 1);
    ELSE
        UPDATE card_issuances SET lm_count = 1, cm_count = 1, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'hdfc' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'hdfc', 1, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 1, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'EASYCREDIT FINSERV' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'EASYCREDIT FINSERV' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('EASYCREDIT FINSERV', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'axis' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'axis', 1, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 1, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'hdfc' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'hdfc', 65, 4);
    ELSE
        UPDATE card_issuances SET lm_count = 65, cm_count = 4, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'tata_neu' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'tata_neu', 58, 188);
    ELSE
        UPDATE card_issuances SET lm_count = 58, cm_count = 188, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'bob', 1, 4);
    ELSE
        UPDATE card_issuances SET lm_count = 1, cm_count = 4, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'yes_zaggle' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'yes_zaggle', 2, 1);
    ELSE
        UPDATE card_issuances SET lm_count = 2, cm_count = 1, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'icici' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'icici', 1, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 1, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'hdfc' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'hdfc', 4, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 4, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'tata_neu' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'tata_neu', 188, 136);
    ELSE
        UPDATE card_issuances SET lm_count = 188, cm_count = 136, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'bob', 4, 3);
    ELSE
        UPDATE card_issuances SET lm_count = 4, cm_count = 3, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'yes_zaggle' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'yes_zaggle', 1, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 1, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'tata_neu' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'tata_neu', 136, 324);
    ELSE
        UPDATE card_issuances SET lm_count = 136, cm_count = 324, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'bob', 3, 8);
    ELSE
        UPDATE card_issuances SET lm_count = 3, cm_count = 8, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'tata_neu' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'tata_neu', 324, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 324, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'bob', 8, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 8, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'SUNIL YADAV' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'SUNIL YADAV' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('SUNIL YADAV', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'hdfc' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'hdfc', 5, 1);
    ELSE
        UPDATE card_issuances SET lm_count = 5, cm_count = 1, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'hdfc' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'hdfc', 1, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 1, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'hdfc' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'hdfc', 0, 1);
    ELSE
        UPDATE card_issuances SET lm_count = 0, cm_count = 1, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'hdfc' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'hdfc', 1, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 1, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'SHUBHAM SHRIVASTAV' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'SHUBHAM SHRIVASTAV' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('SHUBHAM SHRIVASTAV', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'hdfc' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'hdfc', 7, 9);
    ELSE
        UPDATE card_issuances SET lm_count = 7, cm_count = 9, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'hdfc' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'hdfc', 9, 1);
    ELSE
        UPDATE card_issuances SET lm_count = 9, cm_count = 1, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'hdfc' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'hdfc', 1, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 1, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'SHAHDAT ALI' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'SHAHDAT ALI' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('SHAHDAT ALI', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'hdfc' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'hdfc', 0, 5);
    ELSE
        UPDATE card_issuances SET lm_count = 0, cm_count = 5, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'hdfc' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'hdfc', 5, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 5, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    -- Manager: INAYA
    SELECT id INTO v_mgr FROM managers WHERE name = 'INAYA' LIMIT 1;

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'POONAM KAMBLE' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'POONAM KAMBLE' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('POONAM KAMBLE', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'hdfc' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'hdfc', 187, 274);
    ELSE
        UPDATE card_issuances SET lm_count = 187, cm_count = 274, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'tata_neu' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'tata_neu', 908, 1068);
    ELSE
        UPDATE card_issuances SET lm_count = 908, cm_count = 1068, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'hdfc' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'hdfc', 274, 259);
    ELSE
        UPDATE card_issuances SET lm_count = 274, cm_count = 259, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'tata_neu' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'tata_neu', 1068, 1097);
    ELSE
        UPDATE card_issuances SET lm_count = 1068, cm_count = 1097, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'hdfc' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'hdfc', 259, 154);
    ELSE
        UPDATE card_issuances SET lm_count = 259, cm_count = 154, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'tata_neu' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'tata_neu', 1097, 831);
    ELSE
        UPDATE card_issuances SET lm_count = 1097, cm_count = 831, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'hdfc' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'hdfc', 154, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 154, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'tata_neu' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'tata_neu', 831, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 831, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'DIVINE ENTERPRISES' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'DIVINE ENTERPRISES' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('DIVINE ENTERPRISES', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'hdfc' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'hdfc', 1, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 1, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'AIM ENTERPRISES' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'AIM ENTERPRISES' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('AIM ENTERPRISES', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'hdfc' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'hdfc', 15, 2);
    ELSE
        UPDATE card_issuances SET lm_count = 15, cm_count = 2, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'hdfc' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'hdfc', 2, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 2, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'Q GET FINANCIAL TECHNOLOGIES INDIA PVT LTD' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'Q GET FINANCIAL TECHNOLOGIES INDIA PVT LTD' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('Q GET FINANCIAL TECHNOLOGIES INDIA PVT LTD', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'hdfc' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'hdfc', 63, 15);
    ELSE
        UPDATE card_issuances SET lm_count = 63, cm_count = 15, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'idfc' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'idfc', 64, 23);
    ELSE
        UPDATE card_issuances SET lm_count = 64, cm_count = 23, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'tata_neu' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'tata_neu', 0, 25);
    ELSE
        UPDATE card_issuances SET lm_count = 0, cm_count = 25, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'hdfc' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'hdfc', 15, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 15, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'idfc' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'idfc', 23, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 23, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'tata_neu' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'tata_neu', 25, 2073);
    ELSE
        UPDATE card_issuances SET lm_count = 25, cm_count = 2073, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'tata_neu' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'tata_neu', 2073, 1926);
    ELSE
        UPDATE card_issuances SET lm_count = 2073, cm_count = 1926, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'bob', 0, 21);
    ELSE
        UPDATE card_issuances SET lm_count = 0, cm_count = 21, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'tata_neu' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'tata_neu', 1926, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 1926, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'bob', 21, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 21, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'SANVIKA CREDIT ADVISORY' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'SANVIKA CREDIT ADVISORY' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('SANVIKA CREDIT ADVISORY', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'hdfc' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'hdfc', 0, 1);
    ELSE
        UPDATE card_issuances SET lm_count = 0, cm_count = 1, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'hdfc' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'hdfc', 1, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 1, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    -- Manager: BHAVANI
    SELECT id INTO v_mgr FROM managers WHERE name = 'BHAVANI' LIMIT 1;

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'ABHAY PANDEY' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'ABHAY PANDEY' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('ABHAY PANDEY', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'ANIKET' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'ANIKET' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('ANIKET', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'axis' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'axis', 0, 8);
    ELSE
        UPDATE card_issuances SET lm_count = 0, cm_count = 8, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'axis' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'axis', 8, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 8, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'RUDRA' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'RUDRA' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('RUDRA', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'axis' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'axis', 0, 5);
    ELSE
        UPDATE card_issuances SET lm_count = 0, cm_count = 5, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'axis' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'axis', 5, 1);
    ELSE
        UPDATE card_issuances SET lm_count = 5, cm_count = 1, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'axis' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'axis', 1, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 1, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'ANKIT KUMAR' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'ANKIT KUMAR' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('ANKIT KUMAR', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'ARVIND SINGH' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'ARVIND SINGH' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('ARVIND SINGH', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'NARESH' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'NARESH' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('NARESH', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'G K TRADERS' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'G K TRADERS' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('G K TRADERS', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'axis' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'axis', 3, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 3, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'hdfc' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'hdfc', 4, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 4, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'bob', 1, 3);
    ELSE
        UPDATE card_issuances SET lm_count = 1, cm_count = 3, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'yes_zaggle' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'yes_zaggle', 3, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 3, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'bob', 3, 2);
    ELSE
        UPDATE card_issuances SET lm_count = 3, cm_count = 2, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'axis' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'axis', 0, 4);
    ELSE
        UPDATE card_issuances SET lm_count = 0, cm_count = 4, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'hdfc' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'hdfc', 0, 1);
    ELSE
        UPDATE card_issuances SET lm_count = 0, cm_count = 1, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'sbi' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'sbi', 0, 7);
    ELSE
        UPDATE card_issuances SET lm_count = 0, cm_count = 7, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'bob', 2, 5);
    ELSE
        UPDATE card_issuances SET lm_count = 2, cm_count = 5, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'axis' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'axis', 4, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 4, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'hdfc' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'hdfc', 1, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 1, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'sbi' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'sbi', 7, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 7, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'bob', 5, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 5, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'BALAJI ENTERPRISES' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'BALAJI ENTERPRISES' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('BALAJI ENTERPRISES', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'au' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'au', 1, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 1, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'axis' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'axis', 1, 3);
    ELSE
        UPDATE card_issuances SET lm_count = 1, cm_count = 3, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'idfc' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'idfc', 1, 1);
    ELSE
        UPDATE card_issuances SET lm_count = 1, cm_count = 1, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'indus' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'indus', 3, 9);
    ELSE
        UPDATE card_issuances SET lm_count = 3, cm_count = 9, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'tata_neu' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'tata_neu', 2, 1);
    ELSE
        UPDATE card_issuances SET lm_count = 2, cm_count = 1, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'bob', 6, 14);
    ELSE
        UPDATE card_issuances SET lm_count = 6, cm_count = 14, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'axis' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'axis', 3, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 3, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'idfc' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'idfc', 1, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 1, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'indus' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'indus', 9, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 9, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'tata_neu' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'tata_neu', 1, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 1, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'bob', 14, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 14, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'bob', 0, 1);
    ELSE
        UPDATE card_issuances SET lm_count = 0, cm_count = 1, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'yes_zaggle' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'yes_zaggle', 1, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 1, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'bob', 1, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 1, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'BALAJI SOLUTIONS WORK' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'BALAJI SOLUTIONS WORK' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('BALAJI SOLUTIONS WORK', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'hdfc' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'hdfc', 0, 1);
    ELSE
        UPDATE card_issuances SET lm_count = 0, cm_count = 1, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'idfc' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'idfc', 0, 2);
    ELSE
        UPDATE card_issuances SET lm_count = 0, cm_count = 2, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'indus' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'indus', 3, 2);
    ELSE
        UPDATE card_issuances SET lm_count = 3, cm_count = 2, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'sbi' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'sbi', 2, 1);
    ELSE
        UPDATE card_issuances SET lm_count = 2, cm_count = 1, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'bob', 49, 25);
    ELSE
        UPDATE card_issuances SET lm_count = 49, cm_count = 25, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'hdfc' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'hdfc', 1, 3);
    ELSE
        UPDATE card_issuances SET lm_count = 1, cm_count = 3, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'idfc' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'idfc', 2, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 2, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'indus' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'indus', 2, 1);
    ELSE
        UPDATE card_issuances SET lm_count = 2, cm_count = 1, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'sbi' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'sbi', 1, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 1, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'bob', 25, 47);
    ELSE
        UPDATE card_issuances SET lm_count = 25, cm_count = 47, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'hdfc' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'hdfc', 3, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 3, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'indus' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'indus', 1, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 1, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'sbi' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'sbi', 0, 4);
    ELSE
        UPDATE card_issuances SET lm_count = 0, cm_count = 4, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'bob', 47, 98);
    ELSE
        UPDATE card_issuances SET lm_count = 47, cm_count = 98, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'rbl' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'rbl', 0, 2);
    ELSE
        UPDATE card_issuances SET lm_count = 0, cm_count = 2, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'sbi' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'sbi', 4, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 4, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'bob', 98, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 98, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'rbl' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'rbl', 2, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 2, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'QUICK SOLUTIONS' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'QUICK SOLUTIONS' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('QUICK SOLUTIONS', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'HIRDESH' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'HIRDESH' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('HIRDESH', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'idfc' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'idfc', 0, 1);
    ELSE
        UPDATE card_issuances SET lm_count = 0, cm_count = 1, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'idfc' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'idfc', 1, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 1, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'CENTURY CORPORATE SERVICE' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'CENTURY CORPORATE SERVICE' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('CENTURY CORPORATE SERVICE', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'SAMARTH ENTERPRISES' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'SAMARTH ENTERPRISES' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('SAMARTH ENTERPRISES', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'HASMAT' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'HASMAT' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('HASMAT', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'idfc' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'idfc', 2, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 2, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'indus' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'indus', 21, 6);
    ELSE
        UPDATE card_issuances SET lm_count = 21, cm_count = 6, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'bob', 14, 21);
    ELSE
        UPDATE card_issuances SET lm_count = 14, cm_count = 21, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'indus' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'indus', 6, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 6, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'bob', 21, 18);
    ELSE
        UPDATE card_issuances SET lm_count = 21, cm_count = 18, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'bob', 18, 11);
    ELSE
        UPDATE card_issuances SET lm_count = 18, cm_count = 11, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'bob', 11, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 11, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'FINANCIAL GLOBAL SERVICE' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'FINANCIAL GLOBAL SERVICE' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('FINANCIAL GLOBAL SERVICE', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'SHIVAM' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'SHIVAM' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('SHIVAM', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'bob', 34, 6);
    ELSE
        UPDATE card_issuances SET lm_count = 34, cm_count = 6, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'bob', 6, 1);
    ELSE
        UPDATE card_issuances SET lm_count = 6, cm_count = 1, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'yes_zaggle' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'yes_zaggle', 0, 1);
    ELSE
        UPDATE card_issuances SET lm_count = 0, cm_count = 1, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'bob', 1, 1);
    ELSE
        UPDATE card_issuances SET lm_count = 1, cm_count = 1, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'bob', 1, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 1, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'INFINITY ENTERPRISES' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'INFINITY ENTERPRISES' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('INFINITY ENTERPRISES', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'hdfc' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'hdfc', 9, 1);
    ELSE
        UPDATE card_issuances SET lm_count = 9, cm_count = 1, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'idfc' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'idfc', 1, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 1, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'hdfc' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'hdfc', 1, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 1, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'ACCURATE CARDS AND DISTRIBUTION' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'ACCURATE CARDS AND DISTRIBUTION' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('ACCURATE CARDS AND DISTRIBUTION', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'NASEEM AHMAD (KD ENTERPRISES)' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'NASEEM AHMAD (KD ENTERPRISES)' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('NASEEM AHMAD (KD ENTERPRISES)', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'VIKRAM SINGH PATEL' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'VIKRAM SINGH PATEL' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('VIKRAM SINGH PATEL', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'OSR FINANCIAL SERVICES' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'OSR FINANCIAL SERVICES' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('OSR FINANCIAL SERVICES', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'QUANTUMX GLOBAL PRIVATE LIMITED' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'QUANTUMX GLOBAL PRIVATE LIMITED' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('QUANTUMX GLOBAL PRIVATE LIMITED', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'idfc' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'idfc', 50, 34);
    ELSE
        UPDATE card_issuances SET lm_count = 50, cm_count = 34, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'indus' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'indus', 7, 13);
    ELSE
        UPDATE card_issuances SET lm_count = 7, cm_count = 13, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'bob', 66, 112);
    ELSE
        UPDATE card_issuances SET lm_count = 66, cm_count = 112, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'idfc' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'idfc', 34, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 34, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'indus' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'indus', 13, 1);
    ELSE
        UPDATE card_issuances SET lm_count = 13, cm_count = 1, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'bob', 112, 168);
    ELSE
        UPDATE card_issuances SET lm_count = 112, cm_count = 168, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'indus' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'indus', 1, 1);
    ELSE
        UPDATE card_issuances SET lm_count = 1, cm_count = 1, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'bob', 168, 543);
    ELSE
        UPDATE card_issuances SET lm_count = 168, cm_count = 543, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'indus' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'indus', 1, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 1, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'bob', 543, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 543, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'PRUDENS TELESERVICES' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'PRUDENS TELESERVICES' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('PRUDENS TELESERVICES', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'RAHUL KUMAR MISHRA' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'RAHUL KUMAR MISHRA' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('RAHUL KUMAR MISHRA', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'au' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'au', 0, 3);
    ELSE
        UPDATE card_issuances SET lm_count = 0, cm_count = 3, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'axis' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'axis', 0, 39);
    ELSE
        UPDATE card_issuances SET lm_count = 0, cm_count = 39, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'hdfc' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'hdfc', 0, 6);
    ELSE
        UPDATE card_issuances SET lm_count = 0, cm_count = 6, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'indus' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'indus', 1, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 1, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'sbi' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'sbi', 12, 19);
    ELSE
        UPDATE card_issuances SET lm_count = 12, cm_count = 19, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'bob', 82, 75);
    ELSE
        UPDATE card_issuances SET lm_count = 82, cm_count = 75, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'au' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'au', 3, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 3, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'axis' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'axis', 39, 36);
    ELSE
        UPDATE card_issuances SET lm_count = 39, cm_count = 36, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'hdfc' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'hdfc', 6, 7);
    ELSE
        UPDATE card_issuances SET lm_count = 6, cm_count = 7, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'sbi' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'sbi', 19, 19);
    ELSE
        UPDATE card_issuances SET lm_count = 19, cm_count = 19, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'bob', 75, 64);
    ELSE
        UPDATE card_issuances SET lm_count = 75, cm_count = 64, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'au' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'au', 1, 1);
    ELSE
        UPDATE card_issuances SET lm_count = 1, cm_count = 1, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'axis' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'axis', 36, 36);
    ELSE
        UPDATE card_issuances SET lm_count = 36, cm_count = 36, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'hdfc' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'hdfc', 7, 9);
    ELSE
        UPDATE card_issuances SET lm_count = 7, cm_count = 9, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'sbi' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'sbi', 19, 25);
    ELSE
        UPDATE card_issuances SET lm_count = 19, cm_count = 25, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'bob', 64, 206);
    ELSE
        UPDATE card_issuances SET lm_count = 64, cm_count = 206, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'au' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'au', 1, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 1, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'axis' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'axis', 36, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 36, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'hdfc' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'hdfc', 9, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 9, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'sbi' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'sbi', 25, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 25, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'bob', 206, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 206, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'SHAKSHI' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'SHAKSHI' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('SHAKSHI', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'bob', 145, 143);
    ELSE
        UPDATE card_issuances SET lm_count = 145, cm_count = 143, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'au' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'au', 0, 1);
    ELSE
        UPDATE card_issuances SET lm_count = 0, cm_count = 1, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'hdfc' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'hdfc', 0, 1);
    ELSE
        UPDATE card_issuances SET lm_count = 0, cm_count = 1, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'bob', 143, 368);
    ELSE
        UPDATE card_issuances SET lm_count = 143, cm_count = 368, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'hdfc' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'hdfc', 1, 1);
    ELSE
        UPDATE card_issuances SET lm_count = 1, cm_count = 1, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'bob', 368, 259);
    ELSE
        UPDATE card_issuances SET lm_count = 368, cm_count = 259, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'rbl' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'rbl', 0, 2);
    ELSE
        UPDATE card_issuances SET lm_count = 0, cm_count = 2, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'hdfc' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'hdfc', 1, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 1, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'bob', 259, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 259, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'rbl' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'rbl', 2, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 2, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'AED 19 CARD SERVICES PVT LTD' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'AED 19 CARD SERVICES PVT LTD' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('AED 19 CARD SERVICES PVT LTD', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'idfc' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'idfc', 5, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 5, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'indus' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'indus', 1, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 1, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'sbi' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'sbi', 2, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 2, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'bob', 9, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 9, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'VISHAL SHARMA' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'VISHAL SHARMA' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('VISHAL SHARMA', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'axis' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'axis', 6, 12);
    ELSE
        UPDATE card_issuances SET lm_count = 6, cm_count = 12, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'hdfc' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'hdfc', 72, 62);
    ELSE
        UPDATE card_issuances SET lm_count = 72, cm_count = 62, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'idfc' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'idfc', 2, 24);
    ELSE
        UPDATE card_issuances SET lm_count = 2, cm_count = 24, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'indus' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'indus', 6, 6);
    ELSE
        UPDATE card_issuances SET lm_count = 6, cm_count = 6, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'sbi' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'sbi', 4, 3);
    ELSE
        UPDATE card_issuances SET lm_count = 4, cm_count = 3, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'kiwi' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'kiwi', 1, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 1, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'bob', 112, 100);
    ELSE
        UPDATE card_issuances SET lm_count = 112, cm_count = 100, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'axis' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'axis', 12, 7);
    ELSE
        UPDATE card_issuances SET lm_count = 12, cm_count = 7, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'hdfc' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'hdfc', 62, 46);
    ELSE
        UPDATE card_issuances SET lm_count = 62, cm_count = 46, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'idfc' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'idfc', 24, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 24, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'indus' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'indus', 6, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 6, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'sbi' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'sbi', 3, 1);
    ELSE
        UPDATE card_issuances SET lm_count = 3, cm_count = 1, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'bob', 100, 221);
    ELSE
        UPDATE card_issuances SET lm_count = 100, cm_count = 221, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'axis' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'axis', 7, 17);
    ELSE
        UPDATE card_issuances SET lm_count = 7, cm_count = 17, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'hdfc' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'hdfc', 46, 47);
    ELSE
        UPDATE card_issuances SET lm_count = 46, cm_count = 47, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'indus' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'indus', 0, 3);
    ELSE
        UPDATE card_issuances SET lm_count = 0, cm_count = 3, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'sbi' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'sbi', 1, 3);
    ELSE
        UPDATE card_issuances SET lm_count = 1, cm_count = 3, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'bob', 221, 347);
    ELSE
        UPDATE card_issuances SET lm_count = 221, cm_count = 347, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'axis' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'axis', 17, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 17, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'hdfc' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'hdfc', 47, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 47, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'indus' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'indus', 3, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 3, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'sbi' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'sbi', 3, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 3, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'bob', 347, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 347, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'SAGAR' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'SAGAR' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('SAGAR', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'DEV ASSOCIATES' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'DEV ASSOCIATES' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('DEV ASSOCIATES', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'SUNNY' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'SUNNY' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('SUNNY', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'MAYTAWI INDUSTRY PVT LTD' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'MAYTAWI INDUSTRY PVT LTD' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('MAYTAWI INDUSTRY PVT LTD', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'NAAZ' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'NAAZ' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('NAAZ', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'TYAGI INFOSIS' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'TYAGI INFOSIS' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('TYAGI INFOSIS', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'hdfc' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'hdfc', 20, 13);
    ELSE
        UPDATE card_issuances SET lm_count = 20, cm_count = 13, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'indus' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'indus', 0, 1);
    ELSE
        UPDATE card_issuances SET lm_count = 0, cm_count = 1, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'hdfc' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'hdfc', 13, 11);
    ELSE
        UPDATE card_issuances SET lm_count = 13, cm_count = 11, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'indus' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'indus', 1, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 1, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'tata_neu' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'tata_neu', 0, 2);
    ELSE
        UPDATE card_issuances SET lm_count = 0, cm_count = 2, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'hdfc' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'hdfc', 11, 11);
    ELSE
        UPDATE card_issuances SET lm_count = 11, cm_count = 11, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'tata_neu' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'tata_neu', 2, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 2, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'hdfc' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'hdfc', 11, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 11, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'NEERAJ KUMAR' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'NEERAJ KUMAR' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('NEERAJ KUMAR', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'idfc' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'idfc', 0, 3);
    ELSE
        UPDATE card_issuances SET lm_count = 0, cm_count = 3, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'bob', 18, 39);
    ELSE
        UPDATE card_issuances SET lm_count = 18, cm_count = 39, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'au' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'au', 0, 3);
    ELSE
        UPDATE card_issuances SET lm_count = 0, cm_count = 3, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'idfc' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'idfc', 3, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 3, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'bob', 39, 45);
    ELSE
        UPDATE card_issuances SET lm_count = 39, cm_count = 45, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'au' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'au', 3, 3);
    ELSE
        UPDATE card_issuances SET lm_count = 3, cm_count = 3, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'bob', 45, 89);
    ELSE
        UPDATE card_issuances SET lm_count = 45, cm_count = 89, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'rbl' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'rbl', 0, 2);
    ELSE
        UPDATE card_issuances SET lm_count = 0, cm_count = 2, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'au' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'au', 3, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 3, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'bob', 89, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 89, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'rbl' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'rbl', 2, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 2, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'RAVI DUBEY' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'RAVI DUBEY' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('RAVI DUBEY', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'NARENDRA' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'NARENDRA' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('NARENDRA', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'JAI JAGANNATH CARDS SERVICES PRIVATE LIMITED' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'JAI JAGANNATH CARDS SERVICES PRIVATE LIMITED' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('JAI JAGANNATH CARDS SERVICES PRIVATE LIMITED', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'tata_neu' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'tata_neu', 27, 9);
    ELSE
        UPDATE card_issuances SET lm_count = 27, cm_count = 9, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'bob', 3, 66);
    ELSE
        UPDATE card_issuances SET lm_count = 3, cm_count = 66, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'tata_neu' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'tata_neu', 9, 11);
    ELSE
        UPDATE card_issuances SET lm_count = 9, cm_count = 11, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'bob', 66, 158);
    ELSE
        UPDATE card_issuances SET lm_count = 66, cm_count = 158, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'hdfc' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'hdfc', 0, 10);
    ELSE
        UPDATE card_issuances SET lm_count = 0, cm_count = 10, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'tata_neu' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'tata_neu', 11, 14);
    ELSE
        UPDATE card_issuances SET lm_count = 11, cm_count = 14, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'bob', 158, 251);
    ELSE
        UPDATE card_issuances SET lm_count = 158, cm_count = 251, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'hdfc' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'hdfc', 10, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 10, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'tata_neu' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'tata_neu', 14, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 14, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'bob', 251, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 251, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'RIYA' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'RIYA' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('RIYA', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'sbi' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'sbi', 0, 10);
    ELSE
        UPDATE card_issuances SET lm_count = 0, cm_count = 10, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'sbi' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'sbi', 10, 13);
    ELSE
        UPDATE card_issuances SET lm_count = 10, cm_count = 13, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'sbi' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'sbi', 13, 8);
    ELSE
        UPDATE card_issuances SET lm_count = 13, cm_count = 8, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'sbi' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'sbi', 8, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 8, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'RITIK' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'RITIK' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('RITIK', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'MANTU RAJPUT' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'MANTU RAJPUT' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('MANTU RAJPUT', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'CHETAN' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'CHETAN' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('CHETAN', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'SHILPA' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'SHILPA' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('SHILPA', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'au' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'au', 1, 1);
    ELSE
        UPDATE card_issuances SET lm_count = 1, cm_count = 1, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'axis' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'axis', 2, 4);
    ELSE
        UPDATE card_issuances SET lm_count = 2, cm_count = 4, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'hdfc' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'hdfc', 0, 1);
    ELSE
        UPDATE card_issuances SET lm_count = 0, cm_count = 1, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'idfc' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'idfc', 4, 6);
    ELSE
        UPDATE card_issuances SET lm_count = 4, cm_count = 6, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'sbi' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'sbi', 0, 1);
    ELSE
        UPDATE card_issuances SET lm_count = 0, cm_count = 1, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'bob', 7, 32);
    ELSE
        UPDATE card_issuances SET lm_count = 7, cm_count = 32, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'yes_zaggle' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'yes_zaggle', 26, 6);
    ELSE
        UPDATE card_issuances SET lm_count = 26, cm_count = 6, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'au' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'au', 1, 1);
    ELSE
        UPDATE card_issuances SET lm_count = 1, cm_count = 1, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'axis' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'axis', 4, 2);
    ELSE
        UPDATE card_issuances SET lm_count = 4, cm_count = 2, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'hdfc' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'hdfc', 1, 3);
    ELSE
        UPDATE card_issuances SET lm_count = 1, cm_count = 3, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'idfc' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'idfc', 6, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 6, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'sbi' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'sbi', 1, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 1, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'bob', 32, 13);
    ELSE
        UPDATE card_issuances SET lm_count = 32, cm_count = 13, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'yes_zaggle' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'yes_zaggle', 6, 2);
    ELSE
        UPDATE card_issuances SET lm_count = 6, cm_count = 2, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'icici' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'icici', 0, 1);
    ELSE
        UPDATE card_issuances SET lm_count = 0, cm_count = 1, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'au' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'au', 1, 1);
    ELSE
        UPDATE card_issuances SET lm_count = 1, cm_count = 1, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'axis' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'axis', 2, 13);
    ELSE
        UPDATE card_issuances SET lm_count = 2, cm_count = 13, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'hdfc' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'hdfc', 3, 7);
    ELSE
        UPDATE card_issuances SET lm_count = 3, cm_count = 7, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'bob', 13, 25);
    ELSE
        UPDATE card_issuances SET lm_count = 13, cm_count = 25, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'yes_zaggle' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'yes_zaggle', 2, 5);
    ELSE
        UPDATE card_issuances SET lm_count = 2, cm_count = 5, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'au' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'au', 1, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 1, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'axis' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'axis', 13, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 13, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'hdfc' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'hdfc', 7, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 7, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'bob', 25, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 25, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'yes_zaggle' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'yes_zaggle', 5, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 5, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'SANJAY PATEL' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'SANJAY PATEL' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('SANJAY PATEL', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'idfc' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'idfc', 1, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 1, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'bob', 15, 3);
    ELSE
        UPDATE card_issuances SET lm_count = 15, cm_count = 3, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'bob', 3, 64);
    ELSE
        UPDATE card_issuances SET lm_count = 3, cm_count = 64, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'axis' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'axis', 0, 3);
    ELSE
        UPDATE card_issuances SET lm_count = 0, cm_count = 3, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'bob', 64, 32);
    ELSE
        UPDATE card_issuances SET lm_count = 64, cm_count = 32, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'axis' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'axis', 3, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 3, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'bob', 32, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 32, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'SNEHA SHARMA' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'SNEHA SHARMA' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('SNEHA SHARMA', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'au' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'au', 5, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 5, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'axis' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'axis', 5, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 5, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'hdfc' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'hdfc', 4, 1);
    ELSE
        UPDATE card_issuances SET lm_count = 4, cm_count = 1, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'idfc' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'idfc', 7, 8);
    ELSE
        UPDATE card_issuances SET lm_count = 7, cm_count = 8, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'indus' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'indus', 2, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 2, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'sbi' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'sbi', 13, 11);
    ELSE
        UPDATE card_issuances SET lm_count = 13, cm_count = 11, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'yes_zaggle' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'yes_zaggle', 2, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 2, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'axis_lic' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'axis_lic', 0, 1);
    ELSE
        UPDATE card_issuances SET lm_count = 0, cm_count = 1, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'hdfc' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'hdfc', 1, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 1, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'idfc' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'idfc', 8, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 8, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'sbi' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'sbi', 11, 1);
    ELSE
        UPDATE card_issuances SET lm_count = 11, cm_count = 1, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'axis_lic' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'axis_lic', 1, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 1, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'sbi' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'sbi', 1, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 1, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'bob', 0, 139);
    ELSE
        UPDATE card_issuances SET lm_count = 0, cm_count = 139, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'bob', 139, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 139, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'ANJANI PANDEY' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'ANJANI PANDEY' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('ANJANI PANDEY', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'bob', 0, 2);
    ELSE
        UPDATE card_issuances SET lm_count = 0, cm_count = 2, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'bob', 2, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 2, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'AED19 CARD SERVICES PVT LTD' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'AED19 CARD SERVICES PVT LTD' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('AED19 CARD SERVICES PVT LTD', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'bob', 0, 1);
    ELSE
        UPDATE card_issuances SET lm_count = 0, cm_count = 1, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'bob', 1, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 1, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'PRUDENTS' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'PRUDENTS' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('PRUDENTS', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'bob', 0, 1);
    ELSE
        UPDATE card_issuances SET lm_count = 0, cm_count = 1, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'bob', 1, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 1, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'SHIVANSHIENTERPRISES' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'SHIVANSHIENTERPRISES' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('SHIVANSHIENTERPRISES', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'hdfc' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'hdfc', 0, 4);
    ELSE
        UPDATE card_issuances SET lm_count = 0, cm_count = 4, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'hdfc' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'hdfc', 4, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 4, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'SUNIL' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'SUNIL' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('SUNIL', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'hdfc' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'hdfc', 0, 14);
    ELSE
        UPDATE card_issuances SET lm_count = 0, cm_count = 14, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'tata_neu' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'tata_neu', 0, 2);
    ELSE
        UPDATE card_issuances SET lm_count = 0, cm_count = 2, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'hdfc' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'hdfc', 14, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 14, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'tata_neu' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'tata_neu', 2, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 2, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    -- Manager: ZEESHAN HAIDER
    SELECT id INTO v_mgr FROM managers WHERE name = 'ZEESHAN HAIDER' LIMIT 1;

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'ATUL' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'ATUL' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('ATUL', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'ZEESHAN' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'ZEESHAN' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('ZEESHAN', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'bob', 91, 79);
    ELSE
        UPDATE card_issuances SET lm_count = 91, cm_count = 79, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'bob', 79, 99);
    ELSE
        UPDATE card_issuances SET lm_count = 79, cm_count = 99, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'bob', 99, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 99, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'AFSANA BEGUM' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'AFSANA BEGUM' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('AFSANA BEGUM', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'hdfc' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'hdfc', 0, 1);
    ELSE
        UPDATE card_issuances SET lm_count = 0, cm_count = 1, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'hdfc' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'hdfc', 1, 4);
    ELSE
        UPDATE card_issuances SET lm_count = 1, cm_count = 4, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'ADVENTURIA THRILL INDIA PRIVATE LIMITED' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'ADVENTURIA THRILL INDIA PRIVATE LIMITED' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('ADVENTURIA THRILL INDIA PRIVATE LIMITED', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'idfc' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'idfc', 4, 2);
    ELSE
        UPDATE card_issuances SET lm_count = 4, cm_count = 2, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'bob', 80, 80);
    ELSE
        UPDATE card_issuances SET lm_count = 80, cm_count = 80, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'yes_zaggle' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'yes_zaggle', 12, 5);
    ELSE
        UPDATE card_issuances SET lm_count = 12, cm_count = 5, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'idfc' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'idfc', 2, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 2, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'bob', 80, 96);
    ELSE
        UPDATE card_issuances SET lm_count = 80, cm_count = 96, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'yes_zaggle' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'yes_zaggle', 5, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 5, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'bob', 96, 147);
    ELSE
        UPDATE card_issuances SET lm_count = 96, cm_count = 147, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'yes_zaggle' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'yes_zaggle', 0, 1);
    ELSE
        UPDATE card_issuances SET lm_count = 0, cm_count = 1, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'rbl' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'rbl', 0, 3);
    ELSE
        UPDATE card_issuances SET lm_count = 0, cm_count = 3, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'bob', 147, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 147, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'yes_zaggle' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'yes_zaggle', 1, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 1, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'rbl' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'rbl', 3, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 3, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'CREDITLO BUSINESS SOLUTIONS' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'CREDITLO BUSINESS SOLUTIONS' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('CREDITLO BUSINESS SOLUTIONS', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'idfc' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'idfc', 0, 1);
    ELSE
        UPDATE card_issuances SET lm_count = 0, cm_count = 1, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'bob', 0, 6);
    ELSE
        UPDATE card_issuances SET lm_count = 0, cm_count = 6, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'idfc' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'idfc', 1, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 1, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'tata_neu' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'tata_neu', 0, 6);
    ELSE
        UPDATE card_issuances SET lm_count = 0, cm_count = 6, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'bob', 6, 5);
    ELSE
        UPDATE card_issuances SET lm_count = 6, cm_count = 5, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'tata_neu' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'tata_neu', 6, 20);
    ELSE
        UPDATE card_issuances SET lm_count = 6, cm_count = 20, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'bob', 5, 5);
    ELSE
        UPDATE card_issuances SET lm_count = 5, cm_count = 5, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'tata_neu' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'tata_neu', 20, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 20, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'bob', 5, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 5, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'SALEEM' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'SALEEM' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('SALEEM', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'tata_neu' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'tata_neu', 854, 998);
    ELSE
        UPDATE card_issuances SET lm_count = 854, cm_count = 998, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'hdfc' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'hdfc', 0, 204);
    ELSE
        UPDATE card_issuances SET lm_count = 0, cm_count = 204, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'tata_neu' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'tata_neu', 998, 464);
    ELSE
        UPDATE card_issuances SET lm_count = 998, cm_count = 464, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'hdfc' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'hdfc', 204, 885);
    ELSE
        UPDATE card_issuances SET lm_count = 204, cm_count = 885, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'tata_neu' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'tata_neu', 464, 918);
    ELSE
        UPDATE card_issuances SET lm_count = 464, cm_count = 918, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'hdfc' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'hdfc', 885, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 885, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'tata_neu' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'tata_neu', 918, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 918, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'GAGAN' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'GAGAN' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('GAGAN', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'CREDBAE' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'CREDBAE' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('CREDBAE', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'axis' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'axis', 1, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 1, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'idfc' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'idfc', 43, 20);
    ELSE
        UPDATE card_issuances SET lm_count = 43, cm_count = 20, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'bob', 0, 3);
    ELSE
        UPDATE card_issuances SET lm_count = 0, cm_count = 3, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'yes_zaggle' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'yes_zaggle', 5, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 5, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'axis' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'axis', 0, 1);
    ELSE
        UPDATE card_issuances SET lm_count = 0, cm_count = 1, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'hdfc' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'hdfc', 0, 1);
    ELSE
        UPDATE card_issuances SET lm_count = 0, cm_count = 1, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'idfc' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'idfc', 20, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 20, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'bob', 3, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 3, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'axis' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'axis', 1, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 1, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'hdfc' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'hdfc', 1, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 1, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'bob', 0, 1);
    ELSE
        UPDATE card_issuances SET lm_count = 0, cm_count = 1, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'bob', 1, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 1, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'LAKSHAY RATHORE' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'LAKSHAY RATHORE' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('LAKSHAY RATHORE', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'indus' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'indus', 19, 18);
    ELSE
        UPDATE card_issuances SET lm_count = 19, cm_count = 18, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'yes_zaggle' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'yes_zaggle', 0, 1);
    ELSE
        UPDATE card_issuances SET lm_count = 0, cm_count = 1, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'indus' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'indus', 18, 2);
    ELSE
        UPDATE card_issuances SET lm_count = 18, cm_count = 2, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'yes_zaggle' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'yes_zaggle', 1, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 1, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'indus' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'indus', 2, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 2, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'SUBHASH' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'SUBHASH' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('SUBHASH', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'SATENDER' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'SATENDER' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('SATENDER', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'I DOOR WEALTH MENAGMENT' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'I DOOR WEALTH MENAGMENT' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('I DOOR WEALTH MENAGMENT', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'axis' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'axis', 13, 2);
    ELSE
        UPDATE card_issuances SET lm_count = 13, cm_count = 2, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'axis' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'axis', 2, 4);
    ELSE
        UPDATE card_issuances SET lm_count = 2, cm_count = 4, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'tata_neu' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'tata_neu', 0, 2);
    ELSE
        UPDATE card_issuances SET lm_count = 0, cm_count = 2, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'axis' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'axis', 4, 11);
    ELSE
        UPDATE card_issuances SET lm_count = 4, cm_count = 11, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'hdfc' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'hdfc', 0, 2);
    ELSE
        UPDATE card_issuances SET lm_count = 0, cm_count = 2, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'sbi' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'sbi', 0, 3);
    ELSE
        UPDATE card_issuances SET lm_count = 0, cm_count = 3, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'tata_neu' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'tata_neu', 2, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 2, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'axis' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'axis', 11, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 11, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'hdfc' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'hdfc', 2, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 2, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'sbi' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'sbi', 3, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 3, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'ASHISH' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'ASHISH' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('ASHISH', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'GB ENTERPRISE' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'GB ENTERPRISE' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('GB ENTERPRISE', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'bob', 1, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 1, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'bob', 0, 2);
    ELSE
        UPDATE card_issuances SET lm_count = 0, cm_count = 2, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'bob', 2, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 2, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'NITIN' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'NITIN' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('NITIN', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'MANISH' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'MANISH' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('MANISH', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'ETER' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'ETER' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('ETER', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'FARHAD' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'FARHAD' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('FARHAD', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'hdfc' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'hdfc', 1, 1);
    ELSE
        UPDATE card_issuances SET lm_count = 1, cm_count = 1, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'hdfc' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'hdfc', 1, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 1, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'SOHRAB' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'SOHRAB' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('SOHRAB', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'idfc' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'idfc', 0, 9);
    ELSE
        UPDATE card_issuances SET lm_count = 0, cm_count = 9, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'idfc' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'idfc', 9, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 9, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'SUMIT Z' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'SUMIT Z' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('SUMIT Z', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'AMIRUL' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'AMIRUL' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('AMIRUL', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'bob', 4, 1);
    ELSE
        UPDATE card_issuances SET lm_count = 4, cm_count = 1, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'bob', 1, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 1, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'SAIFUDDIN' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'SAIFUDDIN' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('SAIFUDDIN', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'D FINCARD' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'D FINCARD' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('D FINCARD', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'ASCENT' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'ASCENT' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('ASCENT', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'TELERING PROCESS PVT LTD( AKASH)' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'TELERING PROCESS PVT LTD( AKASH)' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('TELERING PROCESS PVT LTD( AKASH)', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'axis' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'axis', 5, 2);
    ELSE
        UPDATE card_issuances SET lm_count = 5, cm_count = 2, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'axis_lic' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'axis_lic', 1, 1);
    ELSE
        UPDATE card_issuances SET lm_count = 1, cm_count = 1, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'hdfc' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'hdfc', 32, 28);
    ELSE
        UPDATE card_issuances SET lm_count = 32, cm_count = 28, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'idfc' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'idfc', 15, 10);
    ELSE
        UPDATE card_issuances SET lm_count = 15, cm_count = 10, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'indus' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'indus', 0, 11);
    ELSE
        UPDATE card_issuances SET lm_count = 0, cm_count = 11, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'sbi' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'sbi', 3, 4);
    ELSE
        UPDATE card_issuances SET lm_count = 3, cm_count = 4, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'yes_zaggle' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'yes_zaggle', 18, 9);
    ELSE
        UPDATE card_issuances SET lm_count = 18, cm_count = 9, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'RAHUL K' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'RAHUL K' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('RAHUL K', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'GULREZ' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'GULREZ' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('GULREZ', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'hdfc' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'hdfc', 0, 5);
    ELSE
        UPDATE card_issuances SET lm_count = 0, cm_count = 5, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'hdfc' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'hdfc', 5, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 5, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'TELERING PROCESS PVT LTD' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'TELERING PROCESS PVT LTD' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('TELERING PROCESS PVT LTD', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'axis' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'axis', 2, 10);
    ELSE
        UPDATE card_issuances SET lm_count = 2, cm_count = 10, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'axis_lic' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'axis_lic', 1, 3);
    ELSE
        UPDATE card_issuances SET lm_count = 1, cm_count = 3, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'hdfc' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'hdfc', 28, 8);
    ELSE
        UPDATE card_issuances SET lm_count = 28, cm_count = 8, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'idfc' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'idfc', 10, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 10, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'indus' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'indus', 11, 10);
    ELSE
        UPDATE card_issuances SET lm_count = 11, cm_count = 10, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'sbi' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'sbi', 4, 3);
    ELSE
        UPDATE card_issuances SET lm_count = 4, cm_count = 3, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'tata_neu' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'tata_neu', 0, 594);
    ELSE
        UPDATE card_issuances SET lm_count = 0, cm_count = 594, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'bob', 0, 7);
    ELSE
        UPDATE card_issuances SET lm_count = 0, cm_count = 7, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'yes_zaggle' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'yes_zaggle', 9, 5);
    ELSE
        UPDATE card_issuances SET lm_count = 9, cm_count = 5, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'axis' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'axis', 10, 15);
    ELSE
        UPDATE card_issuances SET lm_count = 10, cm_count = 15, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'axis_lic' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'axis_lic', 3, 2);
    ELSE
        UPDATE card_issuances SET lm_count = 3, cm_count = 2, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'hdfc' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'hdfc', 8, 26);
    ELSE
        UPDATE card_issuances SET lm_count = 8, cm_count = 26, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'indus' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'indus', 10, 4);
    ELSE
        UPDATE card_issuances SET lm_count = 10, cm_count = 4, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'sbi' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'sbi', 3, 6);
    ELSE
        UPDATE card_issuances SET lm_count = 3, cm_count = 6, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'tata_neu' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'tata_neu', 594, 188);
    ELSE
        UPDATE card_issuances SET lm_count = 594, cm_count = 188, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'bob', 7, 276);
    ELSE
        UPDATE card_issuances SET lm_count = 7, cm_count = 276, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'yes_zaggle' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'yes_zaggle', 5, 11);
    ELSE
        UPDATE card_issuances SET lm_count = 5, cm_count = 11, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'rbl' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'rbl', 0, 26);
    ELSE
        UPDATE card_issuances SET lm_count = 0, cm_count = 26, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'axis' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'axis', 15, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 15, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'axis_lic' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'axis_lic', 2, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 2, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'hdfc' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'hdfc', 26, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 26, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'indus' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'indus', 4, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 4, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'sbi' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'sbi', 6, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 6, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'tata_neu' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'tata_neu', 188, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 188, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'bob', 276, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 276, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'yes_zaggle' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'yes_zaggle', 11, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 11, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'rbl' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'rbl', 26, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 26, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'EXTRA' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'EXTRA' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('EXTRA', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'AFSANA BEGUM/AMIRUL' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'AFSANA BEGUM/AMIRUL' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('AFSANA BEGUM/AMIRUL', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'axis' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'axis', 0, 3);
    ELSE
        UPDATE card_issuances SET lm_count = 0, cm_count = 3, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'hdfc' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'hdfc', 4, 26);
    ELSE
        UPDATE card_issuances SET lm_count = 4, cm_count = 26, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'bob', 0, 4);
    ELSE
        UPDATE card_issuances SET lm_count = 0, cm_count = 4, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'axis' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'axis', 3, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 3, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'hdfc' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'hdfc', 26, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 26, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'bob', 4, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 4, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'BHUVNESH' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'BHUVNESH' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('BHUVNESH', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'bob', 0, 10);
    ELSE
        UPDATE card_issuances SET lm_count = 0, cm_count = 10, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'bob', 10, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 10, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'SWATI (ZEESHAN)' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'SWATI (ZEESHAN)' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('SWATI (ZEESHAN)', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'bob', 0, 2);
    ELSE
        UPDATE card_issuances SET lm_count = 0, cm_count = 2, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'bob', 2, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 2, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    -- Manager: BINOD MISHRA
    SELECT id INTO v_mgr FROM managers WHERE name = 'BINOD MISHRA' LIMIT 1;

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'BISHAL PAUL' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'BISHAL PAUL' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('BISHAL PAUL', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'axis' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'axis', 3, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 3, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'hdfc' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'hdfc', 18, 14);
    ELSE
        UPDATE card_issuances SET lm_count = 18, cm_count = 14, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'bob', 27, 32);
    ELSE
        UPDATE card_issuances SET lm_count = 27, cm_count = 32, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'hdfc' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'hdfc', 14, 10);
    ELSE
        UPDATE card_issuances SET lm_count = 14, cm_count = 10, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'bob', 32, 50);
    ELSE
        UPDATE card_issuances SET lm_count = 32, cm_count = 50, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'yes_zaggle' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'yes_zaggle', 0, 2);
    ELSE
        UPDATE card_issuances SET lm_count = 0, cm_count = 2, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'hdfc' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'hdfc', 10, 2);
    ELSE
        UPDATE card_issuances SET lm_count = 10, cm_count = 2, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'bob', 50, 1);
    ELSE
        UPDATE card_issuances SET lm_count = 50, cm_count = 1, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'yes_zaggle' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'yes_zaggle', 2, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 2, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'hdfc' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'hdfc', 2, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 2, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'bob', 1, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 1, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'ABHIPAY' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'ABHIPAY' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('ABHIPAY', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'axis' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'axis', 77, 2);
    ELSE
        UPDATE card_issuances SET lm_count = 77, cm_count = 2, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'hdfc' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'hdfc', 1, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 1, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'tata_neu' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'tata_neu', 0, 58);
    ELSE
        UPDATE card_issuances SET lm_count = 0, cm_count = 58, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'bob', 31, 7);
    ELSE
        UPDATE card_issuances SET lm_count = 31, cm_count = 7, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'axis' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'axis', 3, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 3, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'tata_neu' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'tata_neu', 58, 145);
    ELSE
        UPDATE card_issuances SET lm_count = 58, cm_count = 145, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'bob', 7, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 7, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'tata_neu' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'tata_neu', 145, 425);
    ELSE
        UPDATE card_issuances SET lm_count = 145, cm_count = 425, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'bob', 0, 1);
    ELSE
        UPDATE card_issuances SET lm_count = 0, cm_count = 1, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'tata_neu' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'tata_neu', 425, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 425, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'bob', 1, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 1, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'PROSENJIT CHATERJEE' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'PROSENJIT CHATERJEE' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('PROSENJIT CHATERJEE', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'axis' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'axis', 17, 1);
    ELSE
        UPDATE card_issuances SET lm_count = 17, cm_count = 1, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'idfc' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'idfc', 21, 13);
    ELSE
        UPDATE card_issuances SET lm_count = 21, cm_count = 13, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'indus' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'indus', 7, 3);
    ELSE
        UPDATE card_issuances SET lm_count = 7, cm_count = 3, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'bob', 50, 39);
    ELSE
        UPDATE card_issuances SET lm_count = 50, cm_count = 39, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'yes_zaggle' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'yes_zaggle', 4, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 4, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'axis' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'axis', 1, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 1, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'idfc' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'idfc', 13, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 13, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'indus' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'indus', 3, 2);
    ELSE
        UPDATE card_issuances SET lm_count = 3, cm_count = 2, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'tata_neu' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'tata_neu', 0, 5);
    ELSE
        UPDATE card_issuances SET lm_count = 0, cm_count = 5, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'bob', 39, 91);
    ELSE
        UPDATE card_issuances SET lm_count = 39, cm_count = 91, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'yes_zaggle' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'yes_zaggle', 0, 2);
    ELSE
        UPDATE card_issuances SET lm_count = 0, cm_count = 2, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'hdfc' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'hdfc', 0, 3);
    ELSE
        UPDATE card_issuances SET lm_count = 0, cm_count = 3, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'indus' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'indus', 2, 1);
    ELSE
        UPDATE card_issuances SET lm_count = 2, cm_count = 1, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'tata_neu' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'tata_neu', 5, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 5, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'bob', 91, 180);
    ELSE
        UPDATE card_issuances SET lm_count = 91, cm_count = 180, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'yes_zaggle' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'yes_zaggle', 2, 2);
    ELSE
        UPDATE card_issuances SET lm_count = 2, cm_count = 2, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'rbl' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'rbl', 0, 14);
    ELSE
        UPDATE card_issuances SET lm_count = 0, cm_count = 14, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'hdfc' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'hdfc', 3, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 3, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'indus' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'indus', 1, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 1, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'bob', 180, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 180, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'yes_zaggle' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'yes_zaggle', 2, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 2, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'rbl' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'rbl', 14, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 14, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'UDYAAM' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'UDYAAM' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('UDYAAM', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'bob', 3, 1);
    ELSE
        UPDATE card_issuances SET lm_count = 3, cm_count = 1, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'SUDIP POUL' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'SUDIP POUL' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('SUDIP POUL', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'axis' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'axis', 46, 44);
    ELSE
        UPDATE card_issuances SET lm_count = 46, cm_count = 44, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'hdfc' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'hdfc', 5, 4);
    ELSE
        UPDATE card_issuances SET lm_count = 5, cm_count = 4, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'idfc' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'idfc', 8, 6);
    ELSE
        UPDATE card_issuances SET lm_count = 8, cm_count = 6, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'indus' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'indus', 0, 1);
    ELSE
        UPDATE card_issuances SET lm_count = 0, cm_count = 1, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'bob', 31, 17);
    ELSE
        UPDATE card_issuances SET lm_count = 31, cm_count = 17, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'yes_zaggle' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'yes_zaggle', 23, 8);
    ELSE
        UPDATE card_issuances SET lm_count = 23, cm_count = 8, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'axis' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'axis', 44, 17);
    ELSE
        UPDATE card_issuances SET lm_count = 44, cm_count = 17, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'hdfc' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'hdfc', 4, 1);
    ELSE
        UPDATE card_issuances SET lm_count = 4, cm_count = 1, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'idfc' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'idfc', 6, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 6, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'indus' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'indus', 1, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 1, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'bob', 17, 19);
    ELSE
        UPDATE card_issuances SET lm_count = 17, cm_count = 19, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'yes_zaggle' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'yes_zaggle', 8, 2);
    ELSE
        UPDATE card_issuances SET lm_count = 8, cm_count = 2, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'au' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'au', 0, 10);
    ELSE
        UPDATE card_issuances SET lm_count = 0, cm_count = 10, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'axis' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'axis', 17, 23);
    ELSE
        UPDATE card_issuances SET lm_count = 17, cm_count = 23, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'hdfc' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'hdfc', 1, 4);
    ELSE
        UPDATE card_issuances SET lm_count = 1, cm_count = 4, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'bob', 19, 48);
    ELSE
        UPDATE card_issuances SET lm_count = 19, cm_count = 48, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'yes_zaggle' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'yes_zaggle', 2, 3);
    ELSE
        UPDATE card_issuances SET lm_count = 2, cm_count = 3, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'rbl' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'rbl', 0, 11);
    ELSE
        UPDATE card_issuances SET lm_count = 0, cm_count = 11, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'au' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'au', 10, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 10, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'axis' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'axis', 23, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 23, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'hdfc' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'hdfc', 4, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 4, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'bob', 48, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 48, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'yes_zaggle' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'yes_zaggle', 3, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 3, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'rbl' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'rbl', 11, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 11, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'RR ASSOCIATES' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'RR ASSOCIATES' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('RR ASSOCIATES', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'au' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'au', 0, 8);
    ELSE
        UPDATE card_issuances SET lm_count = 0, cm_count = 8, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'axis' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'axis', 26, 19);
    ELSE
        UPDATE card_issuances SET lm_count = 26, cm_count = 19, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'hdfc' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'hdfc', 6, 8);
    ELSE
        UPDATE card_issuances SET lm_count = 6, cm_count = 8, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'idfc' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'idfc', 92, 55);
    ELSE
        UPDATE card_issuances SET lm_count = 92, cm_count = 55, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'indus' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'indus', 1, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 1, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'sbi' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'sbi', 2, 2);
    ELSE
        UPDATE card_issuances SET lm_count = 2, cm_count = 2, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'bob', 28, 28);
    ELSE
        UPDATE card_issuances SET lm_count = 28, cm_count = 28, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'yes_zaggle' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'yes_zaggle', 17, 7);
    ELSE
        UPDATE card_issuances SET lm_count = 17, cm_count = 7, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'au' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'au', 8, 35);
    ELSE
        UPDATE card_issuances SET lm_count = 8, cm_count = 35, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'axis' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'axis', 15, 13);
    ELSE
        UPDATE card_issuances SET lm_count = 15, cm_count = 13, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'hdfc' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'hdfc', 8, 11);
    ELSE
        UPDATE card_issuances SET lm_count = 8, cm_count = 11, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'idfc' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'idfc', 55, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 55, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'indus' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'indus', 0, 6);
    ELSE
        UPDATE card_issuances SET lm_count = 0, cm_count = 6, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'sbi' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'sbi', 2, 1);
    ELSE
        UPDATE card_issuances SET lm_count = 2, cm_count = 1, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'tata_neu' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'tata_neu', 0, 83);
    ELSE
        UPDATE card_issuances SET lm_count = 0, cm_count = 83, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'bob', 28, 18);
    ELSE
        UPDATE card_issuances SET lm_count = 28, cm_count = 18, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'yes_zaggle' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'yes_zaggle', 7, 2);
    ELSE
        UPDATE card_issuances SET lm_count = 7, cm_count = 2, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'au' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'au', 35, 40);
    ELSE
        UPDATE card_issuances SET lm_count = 35, cm_count = 40, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'axis' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'axis', 13, 16);
    ELSE
        UPDATE card_issuances SET lm_count = 13, cm_count = 16, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'hdfc' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'hdfc', 13, 14);
    ELSE
        UPDATE card_issuances SET lm_count = 13, cm_count = 14, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'indus' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'indus', 6, 7);
    ELSE
        UPDATE card_issuances SET lm_count = 6, cm_count = 7, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'sbi' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'sbi', 1, 5);
    ELSE
        UPDATE card_issuances SET lm_count = 1, cm_count = 5, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'tata_neu' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'tata_neu', 83, 19);
    ELSE
        UPDATE card_issuances SET lm_count = 83, cm_count = 19, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'bob', 19, 53);
    ELSE
        UPDATE card_issuances SET lm_count = 19, cm_count = 53, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'yes_zaggle' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'yes_zaggle', 2, 3);
    ELSE
        UPDATE card_issuances SET lm_count = 2, cm_count = 3, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'rbl' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'rbl', 0, 9);
    ELSE
        UPDATE card_issuances SET lm_count = 0, cm_count = 9, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'au' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'au', 40, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 40, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'axis' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'axis', 16, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 16, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'hdfc' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'hdfc', 14, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 14, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'indus' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'indus', 7, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 7, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'sbi' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'sbi', 5, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 5, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'tata_neu' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'tata_neu', 19, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 19, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'bob', 53, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 53, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'yes_zaggle' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'yes_zaggle', 3, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 3, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'rbl' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'rbl', 9, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 9, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'SRABANTI PAUL' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'SRABANTI PAUL' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('SRABANTI PAUL', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'axis' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'axis', 7, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 7, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'hdfc' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'hdfc', 1, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 1, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'bob', 21, 18);
    ELSE
        UPDATE card_issuances SET lm_count = 21, cm_count = 18, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'yes_zaggle' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'yes_zaggle', 4, 1);
    ELSE
        UPDATE card_issuances SET lm_count = 4, cm_count = 1, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'axis' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'axis', 0, 9);
    ELSE
        UPDATE card_issuances SET lm_count = 0, cm_count = 9, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'hdfc' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'hdfc', 0, 2);
    ELSE
        UPDATE card_issuances SET lm_count = 0, cm_count = 2, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'tata_neu' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'tata_neu', 0, 5);
    ELSE
        UPDATE card_issuances SET lm_count = 0, cm_count = 5, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'bob', 18, 45);
    ELSE
        UPDATE card_issuances SET lm_count = 18, cm_count = 45, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'yes_zaggle' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'yes_zaggle', 1, 1);
    ELSE
        UPDATE card_issuances SET lm_count = 1, cm_count = 1, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'axis' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'axis', 9, 16);
    ELSE
        UPDATE card_issuances SET lm_count = 9, cm_count = 16, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'hdfc' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'hdfc', 2, 7);
    ELSE
        UPDATE card_issuances SET lm_count = 2, cm_count = 7, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'tata_neu' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'tata_neu', 5, 3);
    ELSE
        UPDATE card_issuances SET lm_count = 5, cm_count = 3, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'bob', 45, 46);
    ELSE
        UPDATE card_issuances SET lm_count = 45, cm_count = 46, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'yes_zaggle' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'yes_zaggle', 1, 1);
    ELSE
        UPDATE card_issuances SET lm_count = 1, cm_count = 1, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'axis' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'axis', 16, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 16, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'hdfc' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'hdfc', 7, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 7, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'tata_neu' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'tata_neu', 3, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 3, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'bob', 46, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 46, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'yes_zaggle' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'yes_zaggle', 1, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 1, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'PARTHO BHATACHARJEE' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'PARTHO BHATACHARJEE' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('PARTHO BHATACHARJEE', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'axis' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'axis', 16, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 16, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'hdfc' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'hdfc', 15, 4);
    ELSE
        UPDATE card_issuances SET lm_count = 15, cm_count = 4, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'idfc' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'idfc', 4, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 4, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'indus' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'indus', 1, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 1, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'bob', 11, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 11, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'hdfc' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'hdfc', 4, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 4, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'S K RABI' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'S K RABI' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('S K RABI', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'idfc' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'idfc', 8, 4);
    ELSE
        UPDATE card_issuances SET lm_count = 8, cm_count = 4, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'bob', 0, 16);
    ELSE
        UPDATE card_issuances SET lm_count = 0, cm_count = 16, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'bob', 16, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 16, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'SECUREPEAK SERVICE PVT LTD' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'SECUREPEAK SERVICE PVT LTD' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('SECUREPEAK SERVICE PVT LTD', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'axis' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'axis', 2, 1);
    ELSE
        UPDATE card_issuances SET lm_count = 2, cm_count = 1, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'hdfc' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'hdfc', 11, 14);
    ELSE
        UPDATE card_issuances SET lm_count = 11, cm_count = 14, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'idfc' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'idfc', 47, 48);
    ELSE
        UPDATE card_issuances SET lm_count = 47, cm_count = 48, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'bob', 7, 11);
    ELSE
        UPDATE card_issuances SET lm_count = 7, cm_count = 11, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'yes_zaggle' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'yes_zaggle', 62, 39);
    ELSE
        UPDATE card_issuances SET lm_count = 62, cm_count = 39, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'au' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'au', 0, 1);
    ELSE
        UPDATE card_issuances SET lm_count = 0, cm_count = 1, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'axis' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'axis', 1, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 1, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'hdfc' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'hdfc', 14, 6);
    ELSE
        UPDATE card_issuances SET lm_count = 14, cm_count = 6, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'idfc' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'idfc', 48, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 48, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'tata_neu' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'tata_neu', 0, 10);
    ELSE
        UPDATE card_issuances SET lm_count = 0, cm_count = 10, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'bob', 11, 11);
    ELSE
        UPDATE card_issuances SET lm_count = 11, cm_count = 11, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'yes_zaggle' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'yes_zaggle', 39, 11);
    ELSE
        UPDATE card_issuances SET lm_count = 39, cm_count = 11, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'au' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'au', 1, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 1, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'axis' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'axis', 0, 1);
    ELSE
        UPDATE card_issuances SET lm_count = 0, cm_count = 1, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'hdfc' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'hdfc', 6, 2);
    ELSE
        UPDATE card_issuances SET lm_count = 6, cm_count = 2, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'tata_neu' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'tata_neu', 10, 8);
    ELSE
        UPDATE card_issuances SET lm_count = 10, cm_count = 8, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'bob', 11, 23);
    ELSE
        UPDATE card_issuances SET lm_count = 11, cm_count = 23, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'yes_zaggle' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'yes_zaggle', 11, 30);
    ELSE
        UPDATE card_issuances SET lm_count = 11, cm_count = 30, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'rbl' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'rbl', 0, 24);
    ELSE
        UPDATE card_issuances SET lm_count = 0, cm_count = 24, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'axis' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'axis', 1, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 1, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'hdfc' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'hdfc', 2, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 2, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'tata_neu' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'tata_neu', 8, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 8, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'bob', 23, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 23, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'yes_zaggle' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'yes_zaggle', 30, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 30, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'rbl' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'rbl', 24, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 24, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'AVIK SAHA' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'AVIK SAHA' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('AVIK SAHA', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'au' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'au', 1, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 1, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'hdfc' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'hdfc', 18, 7);
    ELSE
        UPDATE card_issuances SET lm_count = 18, cm_count = 7, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'idfc' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'idfc', 2, 2);
    ELSE
        UPDATE card_issuances SET lm_count = 2, cm_count = 2, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'bob', 7, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 7, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'yes_zaggle' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'yes_zaggle', 4, 1);
    ELSE
        UPDATE card_issuances SET lm_count = 4, cm_count = 1, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'ABHISHEK SHARMA' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'ABHISHEK SHARMA' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('ABHISHEK SHARMA', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'axis' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'axis', 5, 4);
    ELSE
        UPDATE card_issuances SET lm_count = 5, cm_count = 4, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'hdfc' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'hdfc', 5, 8);
    ELSE
        UPDATE card_issuances SET lm_count = 5, cm_count = 8, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'idfc' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'idfc', 2, 1);
    ELSE
        UPDATE card_issuances SET lm_count = 2, cm_count = 1, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'MADHABI SHOW' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'MADHABI SHOW' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('MADHABI SHOW', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'axis' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'axis', 8, 1);
    ELSE
        UPDATE card_issuances SET lm_count = 8, cm_count = 1, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'hdfc' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'hdfc', 44, 21);
    ELSE
        UPDATE card_issuances SET lm_count = 44, cm_count = 21, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'bob', 7, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 7, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'axis' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'axis', 1, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 1, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'hdfc' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'hdfc', 21, 2);
    ELSE
        UPDATE card_issuances SET lm_count = 21, cm_count = 2, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'bob', 0, 1);
    ELSE
        UPDATE card_issuances SET lm_count = 0, cm_count = 1, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'GROWUP FINANCIAL' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'GROWUP FINANCIAL' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('GROWUP FINANCIAL', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'axis' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'axis', 0, 1);
    ELSE
        UPDATE card_issuances SET lm_count = 0, cm_count = 1, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'tata_neu' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'tata_neu', 0, 1);
    ELSE
        UPDATE card_issuances SET lm_count = 0, cm_count = 1, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'axis' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'axis', 1, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 1, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'tata_neu' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'tata_neu', 1, 1);
    ELSE
        UPDATE card_issuances SET lm_count = 1, cm_count = 1, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'tata_neu' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'tata_neu', 1, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 1, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'FUNDCAP' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'FUNDCAP' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('FUNDCAP', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'axis' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'axis', 0, 1);
    ELSE
        UPDATE card_issuances SET lm_count = 0, cm_count = 1, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'bob', 0, 12);
    ELSE
        UPDATE card_issuances SET lm_count = 0, cm_count = 12, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'axis' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'axis', 1, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 1, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'bob', 12, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 12, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'PARTHA BHATTACHARJEE' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'PARTHA BHATTACHARJEE' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('PARTHA BHATTACHARJEE', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'tata_neu' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'tata_neu', 0, 1);
    ELSE
        UPDATE card_issuances SET lm_count = 0, cm_count = 1, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'tata_neu' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'tata_neu', 1, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 1, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    -- Manager: DIVYAM
    SELECT id INTO v_mgr FROM managers WHERE name = 'DIVYAM' LIMIT 1;

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'AMIT KUMAR' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'AMIT KUMAR' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('AMIT KUMAR', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'axis' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'axis', 0, 3);
    ELSE
        UPDATE card_issuances SET lm_count = 0, cm_count = 3, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'bob', 2, 3);
    ELSE
        UPDATE card_issuances SET lm_count = 2, cm_count = 3, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'ATIK AHMED' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'ATIK AHMED' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('ATIK AHMED', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'au' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'au', 0, 2);
    ELSE
        UPDATE card_issuances SET lm_count = 0, cm_count = 2, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'axis' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'axis', 1, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 1, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'hdfc' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'hdfc', 1, 5);
    ELSE
        UPDATE card_issuances SET lm_count = 1, cm_count = 5, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'sbi' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'sbi', 20, 5);
    ELSE
        UPDATE card_issuances SET lm_count = 20, cm_count = 5, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'kiwi' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'kiwi', 0, 1);
    ELSE
        UPDATE card_issuances SET lm_count = 0, cm_count = 1, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'bob', 0, 3);
    ELSE
        UPDATE card_issuances SET lm_count = 0, cm_count = 3, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'au' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'au', 2, 2);
    ELSE
        UPDATE card_issuances SET lm_count = 2, cm_count = 2, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'hdfc' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'hdfc', 5, 8);
    ELSE
        UPDATE card_issuances SET lm_count = 5, cm_count = 8, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'indus' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'indus', 0, 2);
    ELSE
        UPDATE card_issuances SET lm_count = 0, cm_count = 2, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'sbi' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'sbi', 5, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 5, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'kiwi' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'kiwi', 1, 1);
    ELSE
        UPDATE card_issuances SET lm_count = 1, cm_count = 1, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'bob', 1, 3);
    ELSE
        UPDATE card_issuances SET lm_count = 1, cm_count = 3, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'au' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'au', 2, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 2, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'hdfc' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'hdfc', 8, 4);
    ELSE
        UPDATE card_issuances SET lm_count = 8, cm_count = 4, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'indus' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'indus', 2, 6);
    ELSE
        UPDATE card_issuances SET lm_count = 2, cm_count = 6, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'sbi' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'sbi', 0, 3);
    ELSE
        UPDATE card_issuances SET lm_count = 0, cm_count = 3, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'kiwi' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'kiwi', 1, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 1, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'bob', 3, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 3, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'hdfc' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'hdfc', 4, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 4, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'indus' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'indus', 6, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 6, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'sbi' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'sbi', 3, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 3, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'CRED BAZAR' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'CRED BAZAR' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('CRED BAZAR', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'bob', 7, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 7, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'OWLOTS NEXTGEN PRIVATE LIMITED' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'OWLOTS NEXTGEN PRIVATE LIMITED' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('OWLOTS NEXTGEN PRIVATE LIMITED', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'sbi' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'sbi', 4, 3);
    ELSE
        UPDATE card_issuances SET lm_count = 4, cm_count = 3, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'bob', 18, 32);
    ELSE
        UPDATE card_issuances SET lm_count = 18, cm_count = 32, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'indus' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'indus', 0, 12);
    ELSE
        UPDATE card_issuances SET lm_count = 0, cm_count = 12, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'sbi' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'sbi', 3, 3);
    ELSE
        UPDATE card_issuances SET lm_count = 3, cm_count = 3, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'bob', 32, 61);
    ELSE
        UPDATE card_issuances SET lm_count = 32, cm_count = 61, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'indus' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'indus', 12, 4);
    ELSE
        UPDATE card_issuances SET lm_count = 12, cm_count = 4, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'sbi' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'sbi', 3, 4);
    ELSE
        UPDATE card_issuances SET lm_count = 3, cm_count = 4, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'bob', 61, 140);
    ELSE
        UPDATE card_issuances SET lm_count = 61, cm_count = 140, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'indus' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'indus', 4, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 4, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'sbi' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'sbi', 4, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 4, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'bob', 140, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 140, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'VIKASH SHARMA' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'VIKASH SHARMA' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('VIKASH SHARMA', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'axis' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'axis', 1, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 1, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'JASWANT SINGH' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'JASWANT SINGH' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('JASWANT SINGH', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'KAMLAKAR' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'KAMLAKAR' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('KAMLAKAR', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'hdfc' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'hdfc', 0, 1);
    ELSE
        UPDATE card_issuances SET lm_count = 0, cm_count = 1, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'hdfc' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'hdfc', 1, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 1, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'FAIZAL' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'FAIZAL' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('FAIZAL', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'axis' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'axis', 4, 3);
    ELSE
        UPDATE card_issuances SET lm_count = 4, cm_count = 3, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'hdfc' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'hdfc', 6, 4);
    ELSE
        UPDATE card_issuances SET lm_count = 6, cm_count = 4, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'sbi' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'sbi', 61, 78);
    ELSE
        UPDATE card_issuances SET lm_count = 61, cm_count = 78, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'axis' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'axis', 3, 2);
    ELSE
        UPDATE card_issuances SET lm_count = 3, cm_count = 2, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'hdfc' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'hdfc', 4, 2);
    ELSE
        UPDATE card_issuances SET lm_count = 4, cm_count = 2, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'indus' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'indus', 0, 1);
    ELSE
        UPDATE card_issuances SET lm_count = 0, cm_count = 1, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'sbi' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'sbi', 78, 110);
    ELSE
        UPDATE card_issuances SET lm_count = 78, cm_count = 110, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'axis' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'axis', 2, 7);
    ELSE
        UPDATE card_issuances SET lm_count = 2, cm_count = 7, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'hdfc' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'hdfc', 2, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 2, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'indus' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'indus', 1, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 1, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'sbi' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'sbi', 110, 121);
    ELSE
        UPDATE card_issuances SET lm_count = 110, cm_count = 121, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'axis' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'axis', 7, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 7, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'sbi' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'sbi', 121, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 121, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'BHASKAR CHATTERJEE' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'BHASKAR CHATTERJEE' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('BHASKAR CHATTERJEE', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'VIKRAM PUNE' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'VIKRAM PUNE' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('VIKRAM PUNE', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'tata_neu' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'tata_neu', 222, 324);
    ELSE
        UPDATE card_issuances SET lm_count = 222, cm_count = 324, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'tata_neu' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'tata_neu', 324, 20);
    ELSE
        UPDATE card_issuances SET lm_count = 324, cm_count = 20, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'tata_neu' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'tata_neu', 20, 4);
    ELSE
        UPDATE card_issuances SET lm_count = 20, cm_count = 4, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'tata_neu' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'tata_neu', 4, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 4, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'SAFIYAR' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'SAFIYAR' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('SAFIYAR', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'ATUL PATEL' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'ATUL PATEL' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('ATUL PATEL', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'KUNAL MODI' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'KUNAL MODI' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('KUNAL MODI', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'INDERJEET KOYLE' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'INDERJEET KOYLE' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('INDERJEET KOYLE', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'INTROSPECT FINANCIAL SERVICE' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'INTROSPECT FINANCIAL SERVICE' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('INTROSPECT FINANCIAL SERVICE', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'hdfc' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'hdfc', 8, 10);
    ELSE
        UPDATE card_issuances SET lm_count = 8, cm_count = 10, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'indus' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'indus', 0, 1);
    ELSE
        UPDATE card_issuances SET lm_count = 0, cm_count = 1, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'sbi' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'sbi', 2, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 2, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'hdfc' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'hdfc', 10, 14);
    ELSE
        UPDATE card_issuances SET lm_count = 10, cm_count = 14, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'indus' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'indus', 1, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 1, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'hdfc' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'hdfc', 14, 32);
    ELSE
        UPDATE card_issuances SET lm_count = 14, cm_count = 32, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'hdfc' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'hdfc', 32, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 32, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'VIKAS D' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'VIKAS D' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('VIKAS D', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'hdfc' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'hdfc', 0, 2);
    ELSE
        UPDATE card_issuances SET lm_count = 0, cm_count = 2, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'yes_zaggle' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'yes_zaggle', 1, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 1, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'hdfc' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'hdfc', 2, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 2, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'yes_zaggle' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'yes_zaggle', 0, 1);
    ELSE
        UPDATE card_issuances SET lm_count = 0, cm_count = 1, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'bob', 0, 1);
    ELSE
        UPDATE card_issuances SET lm_count = 0, cm_count = 1, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'yes_zaggle' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'yes_zaggle', 1, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 1, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'bob', 1, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 1, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'VIKAS BHADORIA' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'VIKAS BHADORIA' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('VIKAS BHADORIA', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'hdfc' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'hdfc', 2, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 2, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'tata_neu' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'tata_neu', 5, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 5, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'kiwi' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'kiwi', 1, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 1, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'RAJI BALI' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'RAJI BALI' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('RAJI BALI', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'idfc' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'idfc', 2, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 2, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'KAJAL' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'KAJAL' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('KAJAL', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'PRIYANKA BASAI' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'PRIYANKA BASAI' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('PRIYANKA BASAI', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'KHALID SHAIKH' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'KHALID SHAIKH' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('KHALID SHAIKH', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'yes_zaggle' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'yes_zaggle', 1, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 1, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'BHAVESH' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'BHAVESH' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('BHAVESH', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'MESHIYA HETALBEN TARUNKUMAR' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'MESHIYA HETALBEN TARUNKUMAR' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('MESHIYA HETALBEN TARUNKUMAR', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'sbi' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'sbi', 0, 4);
    ELSE
        UPDATE card_issuances SET lm_count = 0, cm_count = 4, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'bob', 0, 2);
    ELSE
        UPDATE card_issuances SET lm_count = 0, cm_count = 2, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'sbi' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'sbi', 4, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 4, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'bob', 2, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 2, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'bob', 0, 11);
    ELSE
        UPDATE card_issuances SET lm_count = 0, cm_count = 11, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'bob', 11, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 11, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'MILI PRADHAN' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'MILI PRADHAN' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('MILI PRADHAN', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'au' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'au', 0, 1);
    ELSE
        UPDATE card_issuances SET lm_count = 0, cm_count = 1, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'axis_lic' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'axis_lic', 1, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 1, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'hdfc' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'hdfc', 2, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 2, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'indus' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'indus', 2, 2);
    ELSE
        UPDATE card_issuances SET lm_count = 2, cm_count = 2, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'bob', 9, 23);
    ELSE
        UPDATE card_issuances SET lm_count = 9, cm_count = 23, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'au' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'au', 1, 1);
    ELSE
        UPDATE card_issuances SET lm_count = 1, cm_count = 1, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'axis' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'axis', 0, 1);
    ELSE
        UPDATE card_issuances SET lm_count = 0, cm_count = 1, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'hdfc' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'hdfc', 0, 2);
    ELSE
        UPDATE card_issuances SET lm_count = 0, cm_count = 2, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'indus' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'indus', 2, 2);
    ELSE
        UPDATE card_issuances SET lm_count = 2, cm_count = 2, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'bob', 23, 8);
    ELSE
        UPDATE card_issuances SET lm_count = 23, cm_count = 8, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'au' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'au', 1, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 1, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'axis' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'axis', 1, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 1, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'hdfc' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'hdfc', 2, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 2, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'indus' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'indus', 2, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 2, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'bob', 8, 1);
    ELSE
        UPDATE card_issuances SET lm_count = 8, cm_count = 1, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'bob', 1, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 1, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'PAPPU PAL' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'PAPPU PAL' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('PAPPU PAL', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'ARPIT' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'ARPIT' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('ARPIT', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'VISHAL RAVAT' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'VISHAL RAVAT' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('VISHAL RAVAT', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'SURESH' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'SURESH' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('SURESH', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'sbi' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'sbi', 1, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 1, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'UPENDRA KODESA' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'UPENDRA KODESA' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('UPENDRA KODESA', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'axis' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'axis', 1, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 1, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'indus' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'indus', 1, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 1, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'ANSH MANAGEMENT' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'ANSH MANAGEMENT' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('ANSH MANAGEMENT', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'hdfc' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'hdfc', 46, 16);
    ELSE
        UPDATE card_issuances SET lm_count = 46, cm_count = 16, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'hdfc' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'hdfc', 16, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 16, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'HETAL' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'HETAL' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('HETAL', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'sbi' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'sbi', 0, 9);
    ELSE
        UPDATE card_issuances SET lm_count = 0, cm_count = 9, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'sbi' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'sbi', 9, 11);
    ELSE
        UPDATE card_issuances SET lm_count = 9, cm_count = 11, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'sbi' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'sbi', 11, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 11, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'GAJENDRA' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'GAJENDRA' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('GAJENDRA', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'tata_neu' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'tata_neu', 0, 279);
    ELSE
        UPDATE card_issuances SET lm_count = 0, cm_count = 279, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'tata_neu' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'tata_neu', 279, 521);
    ELSE
        UPDATE card_issuances SET lm_count = 279, cm_count = 521, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'tata_neu' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'tata_neu', 521, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 521, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'ABHISHEK' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'ABHISHEK' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('ABHISHEK', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'hdfc' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'hdfc', 0, 3);
    ELSE
        UPDATE card_issuances SET lm_count = 0, cm_count = 3, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'hdfc' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'hdfc', 3, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 3, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'ASHISH JANI' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'ASHISH JANI' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('ASHISH JANI', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'au' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'au', 0, 1);
    ELSE
        UPDATE card_issuances SET lm_count = 0, cm_count = 1, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'au' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'au', 1, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 1, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    -- Manager: VINAY PANDEY
    SELECT id INTO v_mgr FROM managers WHERE name = 'VINAY PANDEY' LIMIT 1;

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'SWATI' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'SWATI' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('SWATI', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'sbi' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'sbi', 34, 15);
    ELSE
        UPDATE card_issuances SET lm_count = 34, cm_count = 15, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'sbi' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'sbi', 15, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 15, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'sbi' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'sbi', 0, 1);
    ELSE
        UPDATE card_issuances SET lm_count = 0, cm_count = 1, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'sbi' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'sbi', 1, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 1, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'VINEET SHARMA' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'VINEET SHARMA' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('VINEET SHARMA', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'hdfc' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'hdfc', 1, 10);
    ELSE
        UPDATE card_issuances SET lm_count = 1, cm_count = 10, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'sbi' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'sbi', 31, 24);
    ELSE
        UPDATE card_issuances SET lm_count = 31, cm_count = 24, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'bob', 0, 1);
    ELSE
        UPDATE card_issuances SET lm_count = 0, cm_count = 1, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'hdfc' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'hdfc', 10, 1);
    ELSE
        UPDATE card_issuances SET lm_count = 10, cm_count = 1, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'sbi' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'sbi', 24, 3);
    ELSE
        UPDATE card_issuances SET lm_count = 24, cm_count = 3, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'bob', 1, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 1, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'hdfc' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'hdfc', 1, 3);
    ELSE
        UPDATE card_issuances SET lm_count = 1, cm_count = 3, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'sbi' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'sbi', 3, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 3, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'bob', 0, 4);
    ELSE
        UPDATE card_issuances SET lm_count = 0, cm_count = 4, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'hdfc' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'hdfc', 3, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 3, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'bob', 4, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 4, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'ADITYA PRATAP' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'ADITYA PRATAP' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('ADITYA PRATAP', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'RIDHVIK FINANCIAL SERVICES' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'RIDHVIK FINANCIAL SERVICES' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('RIDHVIK FINANCIAL SERVICES', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'idfc' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'idfc', 53, 35);
    ELSE
        UPDATE card_issuances SET lm_count = 53, cm_count = 35, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'indus' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'indus', 9, 6);
    ELSE
        UPDATE card_issuances SET lm_count = 9, cm_count = 6, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'tata_neu' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'tata_neu', 1, 8);
    ELSE
        UPDATE card_issuances SET lm_count = 1, cm_count = 8, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'kiwi' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'kiwi', 1, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 1, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'bob', 35, 45);
    ELSE
        UPDATE card_issuances SET lm_count = 35, cm_count = 45, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'idfc' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'idfc', 35, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 35, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'indus' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'indus', 6, 8);
    ELSE
        UPDATE card_issuances SET lm_count = 6, cm_count = 8, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'tata_neu' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'tata_neu', 8, 36);
    ELSE
        UPDATE card_issuances SET lm_count = 8, cm_count = 36, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'bob', 45, 69);
    ELSE
        UPDATE card_issuances SET lm_count = 45, cm_count = 69, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'axis' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'axis', 0, 3);
    ELSE
        UPDATE card_issuances SET lm_count = 0, cm_count = 3, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'indus' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'indus', 8, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 8, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'tata_neu' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'tata_neu', 36, 18);
    ELSE
        UPDATE card_issuances SET lm_count = 36, cm_count = 18, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'bob', 69, 272);
    ELSE
        UPDATE card_issuances SET lm_count = 69, cm_count = 272, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'axis' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'axis', 3, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 3, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'tata_neu' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'tata_neu', 18, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 18, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'bob', 272, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 272, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'ANJALI CHAWLA' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'ANJALI CHAWLA' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('ANJALI CHAWLA', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'ABHISHEK DUTTA' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'ABHISHEK DUTTA' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('ABHISHEK DUTTA', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'indus' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'indus', 7, 8);
    ELSE
        UPDATE card_issuances SET lm_count = 7, cm_count = 8, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'indus' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'indus', 8, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 8, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'indus' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'indus', 0, 2);
    ELSE
        UPDATE card_issuances SET lm_count = 0, cm_count = 2, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'indus' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'indus', 2, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 2, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'FARMAN' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'FARMAN' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('FARMAN', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'hdfc' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'hdfc', 6, 8);
    ELSE
        UPDATE card_issuances SET lm_count = 6, cm_count = 8, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'sbi' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'sbi', 30, 20);
    ELSE
        UPDATE card_issuances SET lm_count = 30, cm_count = 20, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'hdfc' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'hdfc', 6, 7);
    ELSE
        UPDATE card_issuances SET lm_count = 6, cm_count = 7, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'sbi' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'sbi', 20, 12);
    ELSE
        UPDATE card_issuances SET lm_count = 20, cm_count = 12, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'hdfc' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'hdfc', 7, 12);
    ELSE
        UPDATE card_issuances SET lm_count = 7, cm_count = 12, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'sbi' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'sbi', 12, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 12, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'tata_neu' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'tata_neu', 0, 2);
    ELSE
        UPDATE card_issuances SET lm_count = 0, cm_count = 2, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'hdfc' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'hdfc', 12, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 12, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'tata_neu' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'tata_neu', 2, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 2, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'SHREE SHYAM SOLUTION' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'SHREE SHYAM SOLUTION' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('SHREE SHYAM SOLUTION', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'SUNITA (BOOSTER SCORE SOLUTIONS PVT LTD)' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'SUNITA (BOOSTER SCORE SOLUTIONS PVT LTD)' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('SUNITA (BOOSTER SCORE SOLUTIONS PVT LTD)', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'axis' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'axis', 0, 6);
    ELSE
        UPDATE card_issuances SET lm_count = 0, cm_count = 6, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'hdfc' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'hdfc', 55, 41);
    ELSE
        UPDATE card_issuances SET lm_count = 55, cm_count = 41, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'tata_neu' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'tata_neu', 1, 131);
    ELSE
        UPDATE card_issuances SET lm_count = 1, cm_count = 131, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'axis' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'axis', 6, 11);
    ELSE
        UPDATE card_issuances SET lm_count = 6, cm_count = 11, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'hdfc' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'hdfc', 41, 33);
    ELSE
        UPDATE card_issuances SET lm_count = 41, cm_count = 33, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'indus' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'indus', 0, 1);
    ELSE
        UPDATE card_issuances SET lm_count = 0, cm_count = 1, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'tata_neu' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'tata_neu', 131, 198);
    ELSE
        UPDATE card_issuances SET lm_count = 131, cm_count = 198, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'axis' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'axis', 11, 10);
    ELSE
        UPDATE card_issuances SET lm_count = 11, cm_count = 10, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'hdfc' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'hdfc', 33, 55);
    ELSE
        UPDATE card_issuances SET lm_count = 33, cm_count = 55, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'indus' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'indus', 1, 1);
    ELSE
        UPDATE card_issuances SET lm_count = 1, cm_count = 1, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'tata_neu' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'tata_neu', 198, 119);
    ELSE
        UPDATE card_issuances SET lm_count = 198, cm_count = 119, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'rbl' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'rbl', 0, 2);
    ELSE
        UPDATE card_issuances SET lm_count = 0, cm_count = 2, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'axis' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'axis', 10, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 10, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'hdfc' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'hdfc', 55, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 55, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'indus' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'indus', 1, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 1, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'tata_neu' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'tata_neu', 119, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 119, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'rbl' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'rbl', 2, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 2, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'DEEPU RAJPUT' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'DEEPU RAJPUT' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('DEEPU RAJPUT', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'ARPAN TYAGI' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'ARPAN TYAGI' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('ARPAN TYAGI', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'sbi' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'sbi', 7, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 7, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'sbi' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'sbi', 0, 6);
    ELSE
        UPDATE card_issuances SET lm_count = 0, cm_count = 6, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'sbi' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'sbi', 6, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 6, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'ANSHUL CHHIMWAL' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'ANSHUL CHHIMWAL' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('ANSHUL CHHIMWAL', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'INTERNITY PVT LTD' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'INTERNITY PVT LTD' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('INTERNITY PVT LTD', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'sbi' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'sbi', 130, 99);
    ELSE
        UPDATE card_issuances SET lm_count = 130, cm_count = 99, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'ANUBHAV GUPTA' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'ANUBHAV GUPTA' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('ANUBHAV GUPTA', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'hdfc' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'hdfc', 11, 4);
    ELSE
        UPDATE card_issuances SET lm_count = 11, cm_count = 4, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'sbi' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'sbi', 127, 172);
    ELSE
        UPDATE card_issuances SET lm_count = 127, cm_count = 172, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'hdfc' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'hdfc', 4, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 4, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'sbi' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'sbi', 172, 98);
    ELSE
        UPDATE card_issuances SET lm_count = 172, cm_count = 98, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'hdfc' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'hdfc', 0, 17);
    ELSE
        UPDATE card_issuances SET lm_count = 0, cm_count = 17, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'sbi' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'sbi', 98, 61);
    ELSE
        UPDATE card_issuances SET lm_count = 98, cm_count = 61, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'hdfc' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'hdfc', 17, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 17, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'sbi' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'sbi', 61, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 61, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'FINSPARK' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'FINSPARK' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('FINSPARK', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'sbi' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'sbi', 19, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 19, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'GENEX' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'GENEX' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('GENEX', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'PRIYA CHAND' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'PRIYA CHAND' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('PRIYA CHAND', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'indus' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'indus', 0, 4);
    ELSE
        UPDATE card_issuances SET lm_count = 0, cm_count = 4, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'indus' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'indus', 4, 2);
    ELSE
        UPDATE card_issuances SET lm_count = 4, cm_count = 2, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'indus' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'indus', 2, 1);
    ELSE
        UPDATE card_issuances SET lm_count = 2, cm_count = 1, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'indus' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'indus', 1, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 1, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'MD WASIN' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'MD WASIN' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('MD WASIN', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'ARUN KUMAR' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'ARUN KUMAR' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('ARUN KUMAR', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'sbi' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'sbi', 103, 100);
    ELSE
        UPDATE card_issuances SET lm_count = 103, cm_count = 100, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'sbi' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'sbi', 100, 88);
    ELSE
        UPDATE card_issuances SET lm_count = 100, cm_count = 88, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'axis' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'axis', 0, 11);
    ELSE
        UPDATE card_issuances SET lm_count = 0, cm_count = 11, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'sbi' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'sbi', 88, 71);
    ELSE
        UPDATE card_issuances SET lm_count = 88, cm_count = 71, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'axis' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'axis', 11, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 11, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'sbi' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'sbi', 71, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 71, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'ARMAN RANJAN' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'ARMAN RANJAN' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('ARMAN RANJAN', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'sbi' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'sbi', 9, 17);
    ELSE
        UPDATE card_issuances SET lm_count = 9, cm_count = 17, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'sbi' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'sbi', 17, 7);
    ELSE
        UPDATE card_issuances SET lm_count = 17, cm_count = 7, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'sbi' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'sbi', 7, 10);
    ELSE
        UPDATE card_issuances SET lm_count = 7, cm_count = 10, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'sbi' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'sbi', 10, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 10, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'BHARAT ENTERPRISES (PATHWAY SOLUTION)' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'BHARAT ENTERPRISES (PATHWAY SOLUTION)' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('BHARAT ENTERPRISES (PATHWAY SOLUTION)', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'axis_lic' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'axis_lic', 1, 8);
    ELSE
        UPDATE card_issuances SET lm_count = 1, cm_count = 8, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'hdfc' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'hdfc', 16, 8);
    ELSE
        UPDATE card_issuances SET lm_count = 16, cm_count = 8, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'idfc' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'idfc', 225, 188);
    ELSE
        UPDATE card_issuances SET lm_count = 225, cm_count = 188, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'indus' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'indus', 13, 5);
    ELSE
        UPDATE card_issuances SET lm_count = 13, cm_count = 5, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'sbi' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'sbi', 189, 259);
    ELSE
        UPDATE card_issuances SET lm_count = 189, cm_count = 259, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'tata_neu' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'tata_neu', 3, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 3, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'bob', 28, 82);
    ELSE
        UPDATE card_issuances SET lm_count = 28, cm_count = 82, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'yes_zaggle' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'yes_zaggle', 1, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 1, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'axis_lic' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'axis_lic', 8, 12);
    ELSE
        UPDATE card_issuances SET lm_count = 8, cm_count = 12, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'hdfc' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'hdfc', 8, 8);
    ELSE
        UPDATE card_issuances SET lm_count = 8, cm_count = 8, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'idfc' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'idfc', 188, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 188, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'indus' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'indus', 4, 3);
    ELSE
        UPDATE card_issuances SET lm_count = 4, cm_count = 3, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'sbi' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'sbi', 259, 170);
    ELSE
        UPDATE card_issuances SET lm_count = 259, cm_count = 170, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'tata_neu' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'tata_neu', 0, 2);
    ELSE
        UPDATE card_issuances SET lm_count = 0, cm_count = 2, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'bob', 82, 27);
    ELSE
        UPDATE card_issuances SET lm_count = 82, cm_count = 27, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'axis' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'axis', 0, 33);
    ELSE
        UPDATE card_issuances SET lm_count = 0, cm_count = 33, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'axis_lic' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'axis_lic', 12, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 12, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'hdfc' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'hdfc', 8, 94);
    ELSE
        UPDATE card_issuances SET lm_count = 8, cm_count = 94, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'indus' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'indus', 3, 7);
    ELSE
        UPDATE card_issuances SET lm_count = 3, cm_count = 7, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'sbi' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'sbi', 170, 145);
    ELSE
        UPDATE card_issuances SET lm_count = 170, cm_count = 145, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'tata_neu' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'tata_neu', 2, 2);
    ELSE
        UPDATE card_issuances SET lm_count = 2, cm_count = 2, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'bob', 27, 112);
    ELSE
        UPDATE card_issuances SET lm_count = 27, cm_count = 112, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'axis' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'axis', 33, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 33, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'hdfc' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'hdfc', 94, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 94, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'indus' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'indus', 7, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 7, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'sbi' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'sbi', 145, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 145, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'tata_neu' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'tata_neu', 2, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 2, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'bob', 112, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 112, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'CAPITAL CALL SERVICE' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'CAPITAL CALL SERVICE' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('CAPITAL CALL SERVICE', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'indus' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'indus', 0, 10);
    ELSE
        UPDATE card_issuances SET lm_count = 0, cm_count = 10, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'indus' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'indus', 10, 2);
    ELSE
        UPDATE card_issuances SET lm_count = 10, cm_count = 2, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'indus' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'indus', 2, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 2, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'CARD EXPERTISE' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'CARD EXPERTISE' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('CARD EXPERTISE', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'CARDS EXPERTS' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'CARDS EXPERTS' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('CARDS EXPERTS', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'hdfc' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'hdfc', 0, 7);
    ELSE
        UPDATE card_issuances SET lm_count = 0, cm_count = 7, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'indus' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'indus', 15, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 15, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'sbi' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'sbi', 18, 8);
    ELSE
        UPDATE card_issuances SET lm_count = 18, cm_count = 8, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'tata_neu' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'tata_neu', 10, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 10, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'hdfc' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'hdfc', 7, 7);
    ELSE
        UPDATE card_issuances SET lm_count = 7, cm_count = 7, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'sbi' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'sbi', 4, 12);
    ELSE
        UPDATE card_issuances SET lm_count = 4, cm_count = 12, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'axis' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'axis', 0, 66);
    ELSE
        UPDATE card_issuances SET lm_count = 0, cm_count = 66, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'hdfc' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'hdfc', 7, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 7, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'sbi' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'sbi', 12, 25);
    ELSE
        UPDATE card_issuances SET lm_count = 12, cm_count = 25, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'bob', 0, 2);
    ELSE
        UPDATE card_issuances SET lm_count = 0, cm_count = 2, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'axis' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'axis', 66, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 66, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'sbi' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'sbi', 25, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 25, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'bob', 2, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 2, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'DEBSTER MEDIA PRIVATE LIMITED' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'DEBSTER MEDIA PRIVATE LIMITED' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('DEBSTER MEDIA PRIVATE LIMITED', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'idfc' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'idfc', 1, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 1, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'indus' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'indus', 44, 26);
    ELSE
        UPDATE card_issuances SET lm_count = 44, cm_count = 26, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'yes_zaggle' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'yes_zaggle', 1, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 1, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'indus' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'indus', 26, 3);
    ELSE
        UPDATE card_issuances SET lm_count = 26, cm_count = 3, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'indus' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'indus', 3, 3);
    ELSE
        UPDATE card_issuances SET lm_count = 3, cm_count = 3, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'indus' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'indus', 3, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 3, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'GREAT INDIA COMMUNICATIONS' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'GREAT INDIA COMMUNICATIONS' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('GREAT INDIA COMMUNICATIONS', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'SNEHALATA/VINAY' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'SNEHALATA/VINAY' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('SNEHALATA/VINAY', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'K S CARDS' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'K S CARDS' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('K S CARDS', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'indus' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'indus', 0, 2);
    ELSE
        UPDATE card_issuances SET lm_count = 0, cm_count = 2, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'indus' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'indus', 2, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 2, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'NAINSHU/VINAY' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'NAINSHU/VINAY' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('NAINSHU/VINAY', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'sbi' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'sbi', 17, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 17, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'SATYAWAN/VILAS' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'SATYAWAN/VILAS' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('SATYAWAN/VILAS', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'sbi' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'sbi', 8, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 8, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'KHUSHBOO SINGH' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'KHUSHBOO SINGH' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('KHUSHBOO SINGH', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'sbi' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'sbi', 23, 5);
    ELSE
        UPDATE card_issuances SET lm_count = 23, cm_count = 5, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'sbi' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'sbi', 5, 50);
    ELSE
        UPDATE card_issuances SET lm_count = 5, cm_count = 50, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'indus' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'indus', 0, 1);
    ELSE
        UPDATE card_issuances SET lm_count = 0, cm_count = 1, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'sbi' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'sbi', 50, 14);
    ELSE
        UPDATE card_issuances SET lm_count = 50, cm_count = 14, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'indus' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'indus', 1, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 1, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'sbi' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'sbi', 14, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 14, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'AMIT KUMAR SHARMA' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'AMIT KUMAR SHARMA' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('AMIT KUMAR SHARMA', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'idfc' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'idfc', 5, 6);
    ELSE
        UPDATE card_issuances SET lm_count = 5, cm_count = 6, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'bob', 7, 94);
    ELSE
        UPDATE card_issuances SET lm_count = 7, cm_count = 94, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'idfc' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'idfc', 6, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 6, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'bob', 94, 120);
    ELSE
        UPDATE card_issuances SET lm_count = 94, cm_count = 120, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'bob', 120, 87);
    ELSE
        UPDATE card_issuances SET lm_count = 120, cm_count = 87, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'bob', 87, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 87, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'MONEY MART' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'MONEY MART' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('MONEY MART', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'idfc' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'idfc', 4, 4);
    ELSE
        UPDATE card_issuances SET lm_count = 4, cm_count = 4, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'bob', 0, 3);
    ELSE
        UPDATE card_issuances SET lm_count = 0, cm_count = 3, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'idfc' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'idfc', 4, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 4, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'bob', 3, 7);
    ELSE
        UPDATE card_issuances SET lm_count = 3, cm_count = 7, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'bob', 7, 12);
    ELSE
        UPDATE card_issuances SET lm_count = 7, cm_count = 12, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'bob', 12, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 12, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'NEHA SAINI' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'NEHA SAINI' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('NEHA SAINI', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'sbi' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'sbi', 30, 106);
    ELSE
        UPDATE card_issuances SET lm_count = 30, cm_count = 106, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'sbi' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'sbi', 106, 16);
    ELSE
        UPDATE card_issuances SET lm_count = 106, cm_count = 16, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'sbi' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'sbi', 16, 18);
    ELSE
        UPDATE card_issuances SET lm_count = 16, cm_count = 18, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'sbi' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'sbi', 18, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 18, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'SHAILENDRA PANDEY' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'SHAILENDRA PANDEY' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('SHAILENDRA PANDEY', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'SHAHA ZAIDI' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'SHAHA ZAIDI' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('SHAHA ZAIDI', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'RKP96 CARDS SOLUTION PVT LTD' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'RKP96 CARDS SOLUTION PVT LTD' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('RKP96 CARDS SOLUTION PVT LTD', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'S & P FINANCIAL SOLUTIONS' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'S & P FINANCIAL SOLUTIONS' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('S & P FINANCIAL SOLUTIONS', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'au' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'au', 1, 2);
    ELSE
        UPDATE card_issuances SET lm_count = 1, cm_count = 2, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'idfc' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'idfc', 4, 2);
    ELSE
        UPDATE card_issuances SET lm_count = 4, cm_count = 2, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'indus' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'indus', 0, 1);
    ELSE
        UPDATE card_issuances SET lm_count = 0, cm_count = 1, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'sbi' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'sbi', 7, 14);
    ELSE
        UPDATE card_issuances SET lm_count = 7, cm_count = 14, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'bob', 52, 55);
    ELSE
        UPDATE card_issuances SET lm_count = 52, cm_count = 55, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'au' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'au', 2, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 2, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'hdfc' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'hdfc', 0, 3);
    ELSE
        UPDATE card_issuances SET lm_count = 0, cm_count = 3, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'idfc' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'idfc', 2, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 2, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'indus' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'indus', 1, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 1, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'sbi' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'sbi', 14, 8);
    ELSE
        UPDATE card_issuances SET lm_count = 14, cm_count = 8, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'bob', 55, 40);
    ELSE
        UPDATE card_issuances SET lm_count = 55, cm_count = 40, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'axis' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'axis', 0, 4);
    ELSE
        UPDATE card_issuances SET lm_count = 0, cm_count = 4, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'hdfc' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'hdfc', 3, 8);
    ELSE
        UPDATE card_issuances SET lm_count = 3, cm_count = 8, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'sbi' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'sbi', 8, 15);
    ELSE
        UPDATE card_issuances SET lm_count = 8, cm_count = 15, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'tata_neu' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'tata_neu', 0, 1);
    ELSE
        UPDATE card_issuances SET lm_count = 0, cm_count = 1, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'bob', 40, 40);
    ELSE
        UPDATE card_issuances SET lm_count = 40, cm_count = 40, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'axis' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'axis', 4, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 4, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'hdfc' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'hdfc', 8, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 8, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'sbi' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'sbi', 15, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 15, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'tata_neu' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'tata_neu', 1, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 1, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'bob', 40, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 40, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'SAMEER' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'SAMEER' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('SAMEER', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'SUKRITI MANDAL' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'SUKRITI MANDAL' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('SUKRITI MANDAL', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'sbi' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'sbi', 79, 109);
    ELSE
        UPDATE card_issuances SET lm_count = 79, cm_count = 109, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'sbi' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'sbi', 109, 76);
    ELSE
        UPDATE card_issuances SET lm_count = 109, cm_count = 76, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'sbi' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'sbi', 76, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 76, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'SANJAY SAINI' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'SANJAY SAINI' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('SANJAY SAINI', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'axis' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'axis', 2, 9);
    ELSE
        UPDATE card_issuances SET lm_count = 2, cm_count = 9, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'hdfc' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'hdfc', 7, 14);
    ELSE
        UPDATE card_issuances SET lm_count = 7, cm_count = 14, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'idfc' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'idfc', 1, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 1, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'indus' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'indus', 5, 4);
    ELSE
        UPDATE card_issuances SET lm_count = 5, cm_count = 4, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'sbi' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'sbi', 8, 11);
    ELSE
        UPDATE card_issuances SET lm_count = 8, cm_count = 11, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'kiwi' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'kiwi', 1, 1);
    ELSE
        UPDATE card_issuances SET lm_count = 1, cm_count = 1, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'bob', 10, 6);
    ELSE
        UPDATE card_issuances SET lm_count = 10, cm_count = 6, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'axis' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'axis', 9, 19);
    ELSE
        UPDATE card_issuances SET lm_count = 9, cm_count = 19, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'hdfc' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'hdfc', 14, 12);
    ELSE
        UPDATE card_issuances SET lm_count = 14, cm_count = 12, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'indus' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'indus', 4, 4);
    ELSE
        UPDATE card_issuances SET lm_count = 4, cm_count = 4, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'sbi' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'sbi', 11, 9);
    ELSE
        UPDATE card_issuances SET lm_count = 11, cm_count = 9, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'kiwi' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'kiwi', 1, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 1, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'bob', 6, 14);
    ELSE
        UPDATE card_issuances SET lm_count = 6, cm_count = 14, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'au' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'au', 0, 1);
    ELSE
        UPDATE card_issuances SET lm_count = 0, cm_count = 1, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'axis' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'axis', 19, 20);
    ELSE
        UPDATE card_issuances SET lm_count = 19, cm_count = 20, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'hdfc' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'hdfc', 12, 13);
    ELSE
        UPDATE card_issuances SET lm_count = 12, cm_count = 13, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'indus' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'indus', 4, 1);
    ELSE
        UPDATE card_issuances SET lm_count = 4, cm_count = 1, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'sbi' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'sbi', 9, 10);
    ELSE
        UPDATE card_issuances SET lm_count = 9, cm_count = 10, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'bob', 14, 6);
    ELSE
        UPDATE card_issuances SET lm_count = 14, cm_count = 6, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'au' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'au', 1, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 1, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'axis' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'axis', 20, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 20, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'hdfc' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'hdfc', 13, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 13, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'indus' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'indus', 1, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 1, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'sbi' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'sbi', 10, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 10, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'bob', 6, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 6, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'MD ATIF' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'MD ATIF' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('MD ATIF', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'POOJA GUPTA' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'POOJA GUPTA' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('POOJA GUPTA', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'TEJPAL SINGH' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'TEJPAL SINGH' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('TEJPAL SINGH', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'au' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'au', 1, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 1, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'axis' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'axis', 3, 1);
    ELSE
        UPDATE card_issuances SET lm_count = 3, cm_count = 1, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'axis_lic' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'axis_lic', 1, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 1, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'hdfc' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'hdfc', 11, 2);
    ELSE
        UPDATE card_issuances SET lm_count = 11, cm_count = 2, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'idfc' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'idfc', 10, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 10, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'sbi' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'sbi', 16, 12);
    ELSE
        UPDATE card_issuances SET lm_count = 16, cm_count = 12, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'bob', 4, 1);
    ELSE
        UPDATE card_issuances SET lm_count = 4, cm_count = 1, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'axis' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'axis', 1, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 1, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'hdfc' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'hdfc', 2, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 2, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'sbi' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'sbi', 12, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 12, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'bob', 1, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 1, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'MANOJ' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'MANOJ' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('MANOJ', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'SKY HEIGHTS OUTSOURCING SOLUTIONS' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'SKY HEIGHTS OUTSOURCING SOLUTIONS' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('SKY HEIGHTS OUTSOURCING SOLUTIONS', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'hdfc' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'hdfc', 120, 174);
    ELSE
        UPDATE card_issuances SET lm_count = 120, cm_count = 174, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'idfc' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'idfc', 6, 4);
    ELSE
        UPDATE card_issuances SET lm_count = 6, cm_count = 4, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'tata_neu' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'tata_neu', 54, 36);
    ELSE
        UPDATE card_issuances SET lm_count = 54, cm_count = 36, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'hdfc' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'hdfc', 176, 86);
    ELSE
        UPDATE card_issuances SET lm_count = 176, cm_count = 86, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'idfc' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'idfc', 4, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 4, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'tata_neu' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'tata_neu', 36, 25);
    ELSE
        UPDATE card_issuances SET lm_count = 36, cm_count = 25, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'hdfc' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'hdfc', 86, 92);
    ELSE
        UPDATE card_issuances SET lm_count = 86, cm_count = 92, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'tata_neu' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'tata_neu', 25, 69);
    ELSE
        UPDATE card_issuances SET lm_count = 25, cm_count = 69, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'hdfc' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'hdfc', 92, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 92, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'tata_neu' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'tata_neu', 69, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 69, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'PREETAM' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'PREETAM' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('PREETAM', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'bob', 0, 3);
    ELSE
        UPDATE card_issuances SET lm_count = 0, cm_count = 3, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'bob', 3, 4);
    ELSE
        UPDATE card_issuances SET lm_count = 3, cm_count = 4, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'bob', 4, 13);
    ELSE
        UPDATE card_issuances SET lm_count = 4, cm_count = 13, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'bob', 13, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 13, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'RN CARD EXPERTISE PRIVATE LIMITED' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'RN CARD EXPERTISE PRIVATE LIMITED' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('RN CARD EXPERTISE PRIVATE LIMITED', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'idfc' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'idfc', 132, 74);
    ELSE
        UPDATE card_issuances SET lm_count = 132, cm_count = 74, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'sbi' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'sbi', 211, 167);
    ELSE
        UPDATE card_issuances SET lm_count = 211, cm_count = 167, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'idfc' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'idfc', 74, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 74, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'sbi' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'sbi', 167, 113);
    ELSE
        UPDATE card_issuances SET lm_count = 167, cm_count = 113, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'sbi' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'sbi', 113, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 113, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'ZAHID' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'ZAHID' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('ZAHID', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'sbi' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'sbi', 0, 28);
    ELSE
        UPDATE card_issuances SET lm_count = 0, cm_count = 28, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'sbi' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'sbi', 28, 38);
    ELSE
        UPDATE card_issuances SET lm_count = 28, cm_count = 38, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'sbi' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'sbi', 38, 18);
    ELSE
        UPDATE card_issuances SET lm_count = 38, cm_count = 18, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'sbi' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'sbi', 18, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 18, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'VIKAS' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'VIKAS' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('VIKAS', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'sbi' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'sbi', 67, 30);
    ELSE
        UPDATE card_issuances SET lm_count = 67, cm_count = 30, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'sbi' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'sbi', 30, 140);
    ELSE
        UPDATE card_issuances SET lm_count = 30, cm_count = 140, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'sbi' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'sbi', 140, 7);
    ELSE
        UPDATE card_issuances SET lm_count = 140, cm_count = 7, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'sbi' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'sbi', 7, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 7, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'VARSHA RANI' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'VARSHA RANI' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('VARSHA RANI', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'indus' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'indus', 0, 2);
    ELSE
        UPDATE card_issuances SET lm_count = 0, cm_count = 2, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'sbi' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'sbi', 0, 8);
    ELSE
        UPDATE card_issuances SET lm_count = 0, cm_count = 8, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'bob', 6, 10);
    ELSE
        UPDATE card_issuances SET lm_count = 6, cm_count = 10, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'indus' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'indus', 2, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 2, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'sbi' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'sbi', 5, 3);
    ELSE
        UPDATE card_issuances SET lm_count = 5, cm_count = 3, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'bob', 10, 45);
    ELSE
        UPDATE card_issuances SET lm_count = 10, cm_count = 45, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'sbi' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'sbi', 3, 1);
    ELSE
        UPDATE card_issuances SET lm_count = 3, cm_count = 1, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'bob', 45, 43);
    ELSE
        UPDATE card_issuances SET lm_count = 45, cm_count = 43, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'sbi' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'sbi', 1, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 1, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'bob', 43, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 43, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'SANTOSH KUMAR SHARMA' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'SANTOSH KUMAR SHARMA' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('SANTOSH KUMAR SHARMA', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'bob', 2, 3);
    ELSE
        UPDATE card_issuances SET lm_count = 2, cm_count = 3, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'tata_neu' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'tata_neu', 0, 2);
    ELSE
        UPDATE card_issuances SET lm_count = 0, cm_count = 2, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'bob', 3, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 3, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'tata_neu' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'tata_neu', 2, 3);
    ELSE
        UPDATE card_issuances SET lm_count = 2, cm_count = 3, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'bob', 0, 18);
    ELSE
        UPDATE card_issuances SET lm_count = 0, cm_count = 18, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'tata_neu' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'tata_neu', 3, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 3, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'bob', 18, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 18, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'SHRESHREY CARD SERVICES PRIVATE LIMITED' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'SHRESHREY CARD SERVICES PRIVATE LIMITED' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('SHRESHREY CARD SERVICES PRIVATE LIMITED', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'axis' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'axis', 66, 2);
    ELSE
        UPDATE card_issuances SET lm_count = 66, cm_count = 2, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'yes_zaggle' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'yes_zaggle', 153, 195);
    ELSE
        UPDATE card_issuances SET lm_count = 153, cm_count = 195, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'axis' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'axis', 2, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 2, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'yes_zaggle' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'yes_zaggle', 195, 6);
    ELSE
        UPDATE card_issuances SET lm_count = 195, cm_count = 6, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'yes_zaggle' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'yes_zaggle', 6, 30);
    ELSE
        UPDATE card_issuances SET lm_count = 6, cm_count = 30, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'yes_zaggle' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'yes_zaggle', 30, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 30, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'UMA SINGH ( SHIVI CARDS SERVICES)' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'UMA SINGH ( SHIVI CARDS SERVICES)' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('UMA SINGH ( SHIVI CARDS SERVICES)', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'au' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'au', 1, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 1, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'axis' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'axis', 11, 15);
    ELSE
        UPDATE card_issuances SET lm_count = 11, cm_count = 15, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'indus' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'indus', 0, 3);
    ELSE
        UPDATE card_issuances SET lm_count = 0, cm_count = 3, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'bob', 1, 19);
    ELSE
        UPDATE card_issuances SET lm_count = 1, cm_count = 19, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'axis' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'axis', 15, 14);
    ELSE
        UPDATE card_issuances SET lm_count = 15, cm_count = 14, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'indus' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'indus', 3, 5);
    ELSE
        UPDATE card_issuances SET lm_count = 3, cm_count = 5, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'bob', 19, 100);
    ELSE
        UPDATE card_issuances SET lm_count = 19, cm_count = 100, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'axis' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'axis', 14, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 14, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'indus' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'indus', 5, 2);
    ELSE
        UPDATE card_issuances SET lm_count = 5, cm_count = 2, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'sbi' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'sbi', 0, 1);
    ELSE
        UPDATE card_issuances SET lm_count = 0, cm_count = 1, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'bob', 100, 261);
    ELSE
        UPDATE card_issuances SET lm_count = 100, cm_count = 261, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'rbl' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'rbl', 0, 10);
    ELSE
        UPDATE card_issuances SET lm_count = 0, cm_count = 10, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'indus' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'indus', 2, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 2, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'sbi' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'sbi', 1, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 1, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'bob', 261, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 261, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'rbl' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'rbl', 10, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 10, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'RUPI BAZAAR FINTECH PVT LTD' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'RUPI BAZAAR FINTECH PVT LTD' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('RUPI BAZAAR FINTECH PVT LTD', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'indus' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'indus', 9, 18);
    ELSE
        UPDATE card_issuances SET lm_count = 9, cm_count = 18, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'indus' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'indus', 19, 4);
    ELSE
        UPDATE card_issuances SET lm_count = 19, cm_count = 4, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'indus' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'indus', 4, 5);
    ELSE
        UPDATE card_issuances SET lm_count = 4, cm_count = 5, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'indus' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'indus', 5, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 5, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'INTERNITY' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'INTERNITY' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('INTERNITY', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'sbi' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'sbi', 99, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 99, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'AKASH CHAUHAN' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'AKASH CHAUHAN' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('AKASH CHAUHAN', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'sbi' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'sbi', 0, 73);
    ELSE
        UPDATE card_issuances SET lm_count = 0, cm_count = 73, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'AYUSH' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'AYUSH' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('AYUSH', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'indus' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'indus', 0, 5);
    ELSE
        UPDATE card_issuances SET lm_count = 0, cm_count = 5, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'indus' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'indus', 5, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 5, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'KRISHNA' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'KRISHNA' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('KRISHNA', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'bob', 0, 9);
    ELSE
        UPDATE card_issuances SET lm_count = 0, cm_count = 9, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'bob', 9, 5);
    ELSE
        UPDATE card_issuances SET lm_count = 9, cm_count = 5, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'bob', 5, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 5, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'RAHUL' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'RAHUL' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('RAHUL', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'sbi' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'sbi', 0, 1);
    ELSE
        UPDATE card_issuances SET lm_count = 0, cm_count = 1, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'axis' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'axis', 0, 2);
    ELSE
        UPDATE card_issuances SET lm_count = 0, cm_count = 2, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'sbi' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'sbi', 1, 18);
    ELSE
        UPDATE card_issuances SET lm_count = 1, cm_count = 18, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'bob', 0, 5);
    ELSE
        UPDATE card_issuances SET lm_count = 0, cm_count = 5, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'axis' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'axis', 2, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 2, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'sbi' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'sbi', 18, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 18, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'bob', 5, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 5, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'IMRAN' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'IMRAN' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('IMRAN', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'indus' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'indus', 0, 9);
    ELSE
        UPDATE card_issuances SET lm_count = 0, cm_count = 9, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'indus' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'indus', 9, 4);
    ELSE
        UPDATE card_issuances SET lm_count = 9, cm_count = 4, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'indus' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'indus', 4, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 4, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'AKSH CHOUHAN' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'AKSH CHOUHAN' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('AKSH CHOUHAN', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'sbi' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'sbi', 73, 48);
    ELSE
        UPDATE card_issuances SET lm_count = 73, cm_count = 48, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'sbi' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'sbi', 48, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 48, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'UNIQE MONEY' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'UNIQE MONEY' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('UNIQE MONEY', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'sbi' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'sbi', 0, 49);
    ELSE
        UPDATE card_issuances SET lm_count = 0, cm_count = 49, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'sbi' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'sbi', 49, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 49, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'SNEHLATA' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'SNEHLATA' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('SNEHLATA', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'sbi' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'sbi', 0, 41);
    ELSE
        UPDATE card_issuances SET lm_count = 0, cm_count = 41, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'sbi' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'sbi', 41, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 41, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    -- Manager: ALKESH SHUKLA
    SELECT id INTO v_mgr FROM managers WHERE name = 'ALKESH SHUKLA' LIMIT 1;

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'ANKIT KHARE' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'ANKIT KHARE' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('ANKIT KHARE', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'AMIT SINGH' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'AMIT SINGH' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('AMIT SINGH', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'IMAM ALI' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'IMAM ALI' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('IMAM ALI', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'ABHISHEK CHANYAL' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'ABHISHEK CHANYAL' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('ABHISHEK CHANYAL', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'hdfc' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'hdfc', 5, 2);
    ELSE
        UPDATE card_issuances SET lm_count = 5, cm_count = 2, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'hdfc' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'hdfc', 2, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 2, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'hdfc' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'hdfc', 0, 13);
    ELSE
        UPDATE card_issuances SET lm_count = 0, cm_count = 13, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'tata_neu' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'tata_neu', 0, 5);
    ELSE
        UPDATE card_issuances SET lm_count = 0, cm_count = 5, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'bob', 0, 2);
    ELSE
        UPDATE card_issuances SET lm_count = 0, cm_count = 2, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'hdfc' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'hdfc', 13, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 13, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'tata_neu' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'tata_neu', 5, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 5, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'bob', 2, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 2, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'JAIKESH SHUKLA' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'JAIKESH SHUKLA' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('JAIKESH SHUKLA', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'MADHU YADAV' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'MADHU YADAV' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('MADHU YADAV', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'hdfc' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'hdfc', 0, 1);
    ELSE
        UPDATE card_issuances SET lm_count = 0, cm_count = 1, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'au' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'au', 0, 1);
    ELSE
        UPDATE card_issuances SET lm_count = 0, cm_count = 1, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'hdfc' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'hdfc', 1, 2);
    ELSE
        UPDATE card_issuances SET lm_count = 1, cm_count = 2, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'au' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'au', 1, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 1, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'hdfc' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'hdfc', 2, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 2, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'RITU SHUKLA' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'RITU SHUKLA' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('RITU SHUKLA', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'axis' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'axis', 4, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 4, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'hdfc' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'hdfc', 31, 21);
    ELSE
        UPDATE card_issuances SET lm_count = 31, cm_count = 21, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'indus' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'indus', 5, 5);
    ELSE
        UPDATE card_issuances SET lm_count = 5, cm_count = 5, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'sbi' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'sbi', 4, 2);
    ELSE
        UPDATE card_issuances SET lm_count = 4, cm_count = 2, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'hdfc' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'hdfc', 21, 26);
    ELSE
        UPDATE card_issuances SET lm_count = 21, cm_count = 26, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'indus' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'indus', 5, 2);
    ELSE
        UPDATE card_issuances SET lm_count = 5, cm_count = 2, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'sbi' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'sbi', 2, 3);
    ELSE
        UPDATE card_issuances SET lm_count = 2, cm_count = 3, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'hdfc' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'hdfc', 26, 26);
    ELSE
        UPDATE card_issuances SET lm_count = 26, cm_count = 26, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'indus' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'indus', 2, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 2, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'sbi' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'sbi', 3, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 3, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'tata_neu' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'tata_neu', 0, 1);
    ELSE
        UPDATE card_issuances SET lm_count = 0, cm_count = 1, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'bob', 0, 6);
    ELSE
        UPDATE card_issuances SET lm_count = 0, cm_count = 6, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'hdfc' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'hdfc', 26, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 26, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'tata_neu' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'tata_neu', 1, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 1, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'bob', 6, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 6, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'ZAID ASKARI' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'ZAID ASKARI' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('ZAID ASKARI', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'UPENDRA KUMAR SINGH' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'UPENDRA KUMAR SINGH' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('UPENDRA KUMAR SINGH', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'axis' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'axis', 0, 4);
    ELSE
        UPDATE card_issuances SET lm_count = 0, cm_count = 4, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'axis_lic' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'axis_lic', 1, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 1, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'axis' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'axis', 4, 6);
    ELSE
        UPDATE card_issuances SET lm_count = 4, cm_count = 6, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'axis' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'axis', 6, 1);
    ELSE
        UPDATE card_issuances SET lm_count = 6, cm_count = 1, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'axis' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'axis', 1, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 1, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'VIJAY RASTOGI' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'VIJAY RASTOGI' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('VIJAY RASTOGI', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'hdfc' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'hdfc', 1, 1);
    ELSE
        UPDATE card_issuances SET lm_count = 1, cm_count = 1, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'hdfc' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'hdfc', 1, 2);
    ELSE
        UPDATE card_issuances SET lm_count = 1, cm_count = 2, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'hdfc' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'hdfc', 2, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 2, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'VIPIN KUMAR TIWARI' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'VIPIN KUMAR TIWARI' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('VIPIN KUMAR TIWARI', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'hdfc' AND month_year = '2026-07' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-07', v_cp, 'hdfc', 34, 1);
    ELSE
        UPDATE card_issuances SET lm_count = 34, cm_count = 1, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'hdfc' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'hdfc', 1, 35);
    ELSE
        UPDATE card_issuances SET lm_count = 1, cm_count = 35, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'hdfc' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'hdfc', 35, 1);
    ELSE
        UPDATE card_issuances SET lm_count = 35, cm_count = 1, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'hdfc' AND month_year = '2026-10' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-10', v_cp, 'hdfc', 1, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 1, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_cp FROM channel_partners WHERE name = 'ZAINAB NADEEM' AND manager_id = v_mgr LIMIT 1;
    IF v_cp IS NULL THEN
        SELECT id INTO v_cp FROM channel_partners WHERE name = 'ZAINAB NADEEM' LIMIT 1;
        IF v_cp IS NULL THEN
            INSERT INTO channel_partners (name, manager_id) VALUES ('ZAINAB NADEEM', v_mgr) RETURNING id INTO v_cp;
        ELSE
            UPDATE channel_partners SET manager_id = v_mgr WHERE id = v_cp;
        END IF;
    END IF;
        

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'hdfc' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'hdfc', 0, 2);
    ELSE
        UPDATE card_issuances SET lm_count = 0, cm_count = 2, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-08' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-08', v_cp, 'bob', 0, 1);
    ELSE
        UPDATE card_issuances SET lm_count = 0, cm_count = 1, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'hdfc' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'hdfc', 2, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 2, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

    SELECT id INTO v_ci FROM card_issuances WHERE partner_id = v_cp AND bank_id = 'bob' AND month_year = '2026-09' LIMIT 1;
    IF v_ci IS NULL THEN
        INSERT INTO card_issuances (month_year, partner_id, bank_id, lm_count, cm_count) VALUES ('2026-09', v_cp, 'bob', 1, 0);
    ELSE
        UPDATE card_issuances SET lm_count = 1, cm_count = 0, updated_at = now() WHERE id = v_ci;
    END IF;

END $$;
