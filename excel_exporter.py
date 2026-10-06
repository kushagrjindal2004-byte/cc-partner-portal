import os
from openpyxl import Workbook
from openpyxl.styles import Font, PatternFill, Alignment, Border, Side
from openpyxl.utils import get_column_letter

def generate_excel_file(data, output_path="portal_export.xlsx"):
    """
    Generates a professionally styled Excel file meeting the exact standards:
    - Light orange highlight for Manager rows with automatic SUMs
    - Formatted Bank column headers with LM (Last Month) and CM (Current Month)
    - Channel partners listed beneath their respective Manager
    - Grand Total row at the bottom with double underline & bold styling
    - Working Capital and Bank Status sheets
    """
    wb = Workbook()
    
    # Setup Sheet 1: Master CC Issuance
    ws1 = wb.active
    ws1.title = "CC Issuance Master"
    ws1.views.sheetView[0].showGridLines = True
    
    # Setup styles
    font_title = Font(name="Calibri", size=14, bold=True, color="1E3A8A")
    font_header = Font(name="Calibri", size=11, bold=True, color="FFFFFF")
    font_sub_header = Font(name="Calibri", size=10, bold=True, color="FFFFFF")
    font_manager = Font(name="Calibri", size=11, bold=True, color="7C2D12")
    font_partner = Font(name="Calibri", size=10, color="1F2937")
    font_grand_total = Font(name="Calibri", size=11, bold=True, color="000000")
    
    # Fills
    fill_header = PatternFill(start_color="1E3A8A", end_color="1E3A8A", fill_type="solid") # Dark Navy
    fill_sub_header = PatternFill(start_color="3B82F6", end_color="3B82F6", fill_type="solid") # Blue
    fill_manager = PatternFill(start_color="FED7AA", end_color="FED7AA", fill_type="solid") # Light Orange (#FED7AA / #FFE4C4)
    fill_grand_total = PatternFill(start_color="E2E8F0", end_color="E2E8F0", fill_type="solid") # Slate
    fill_even_row = PatternFill(start_color="F8FAFC", end_color="F8FAFC", fill_type="solid")
    
    # Borders
    thin_border_side = Side(style='thin', color='CBD5E1')
    border_cell = Border(left=thin_border_side, right=thin_border_side, top=thin_border_side, bottom=thin_border_side)
    
    border_manager = Border(
        left=thin_border_side, right=thin_border_side,
        top=Side(style='medium', color='EA580C'),
        bottom=Side(style='medium', color='EA580C')
    )
    
    border_grand_total = Border(
        left=thin_border_side, right=thin_border_side,
        top=Side(style='thin', color='000000'),
        bottom=Side(style='double', color='000000')
    )
    
    # Alignments
    align_center = Alignment(horizontal="center", vertical="center")
    align_left = Alignment(horizontal="left", vertical="center")
    align_right = Alignment(horizontal="right", vertical="center")
    
    banks = data.get("banks", [])
    managers = data.get("managers", [])
    
    # Row 1: Title
    ws1.merge_cells("A1:Z1")
    ws1["A1"] = f"{data.get('title', 'Channel Partner Credit Card Issuance Portal')} - {data.get('last_month_name', 'LM')} vs {data.get('current_month_name', 'CM')}"
    ws1["A1"].font = font_title
    ws1["A1"].alignment = Alignment(horizontal="left", vertical="center")
    ws1.row_dimensions[1].height = 28
    
    # Row 2 & 3: Headers
    # Col A: PARTNERS
    ws1.merge_cells("A2:A3")
    ws1["A2"] = "PARTNERS / MANAGERS"
    ws1["A2"].font = font_header
    ws1["A2"].fill = fill_header
    ws1["A2"].alignment = align_center
    ws1["A2"].border = border_cell
    ws1["A3"].border = border_cell
    
    # Col B & C: TOTAL
    ws1.merge_cells("B2:C2")
    ws1["B2"] = "TOTAL CARDS"
    ws1["B2"].font = font_header
    ws1["B2"].fill = fill_header
    ws1["B2"].alignment = align_center
    ws1["B2"].border = border_cell
    ws1["C2"].border = border_cell
    
    ws1["B3"] = "LMT"
    ws1["B3"].font = font_sub_header
    ws1["B3"].fill = fill_sub_header
    ws1["B3"].alignment = align_center
    ws1["B3"].border = border_cell
    
    ws1["C3"] = "CMT"
    ws1["C3"].font = font_sub_header
    ws1["C3"].fill = fill_sub_header
    ws1["C3"].alignment = align_center
    ws1["C3"].border = border_cell
    
    # Bank Columns
    current_col = 4
    for b in banks:
        b_name = b["name"]
        status_suffix = f" ({b.get('status', 'FINAL')})" if b.get('status') else ""
        col_letter_1 = get_column_letter(current_col)
        col_letter_2 = get_column_letter(current_col + 1)
        
        ws1.merge_cells(f"{col_letter_1}2:{col_letter_2}2")
        cell_top = ws1[f"{col_letter_1}2"]
        cell_top.value = f"{b_name}{status_suffix}"
        cell_top.font = font_header
        cell_top.fill = fill_header
        cell_top.alignment = align_center
        cell_top.border = border_cell
        ws1[f"{col_letter_2}2"].border = border_cell
        
        # Sub headers LM and CM
        cell_lm = ws1[f"{col_letter_1}3"]
        cell_lm.value = "LM"
        cell_lm.font = font_sub_header
        cell_lm.fill = fill_sub_header
        cell_lm.alignment = align_center
        cell_lm.border = border_cell
        
        cell_cm = ws1[f"{col_letter_2}3"]
        cell_cm.value = "CM"
        cell_cm.font = font_sub_header
        cell_cm.fill = fill_sub_header
        cell_cm.alignment = align_center
        cell_cm.border = border_cell
        
        current_col += 2
        
    ws1.row_dimensions[2].height = 24
    ws1.row_dimensions[3].height = 20
    
    row_idx = 4
    manager_row_indices = []
    
    for mgr in managers:
        mgr_name = mgr.get("manager_name", "").strip()
        partners = mgr.get("partners", [])
        
        mgr_row_num = row_idx
        manager_row_indices.append(mgr_row_num)
        row_idx += 1
        
        # Write partner rows first to know their range for formula
        partner_start_row = row_idx
        for p_idx, p in enumerate(partners):
            p_name = p.get("name", "").strip()
            ws1.cell(row=row_idx, column=1, value=f"    {p_name}") # Indented partner name
            ws1.cell(row=row_idx, column=1).font = font_partner
            ws1.cell(row=row_idx, column=1).alignment = align_left
            ws1.cell(row=row_idx, column=1).border = border_cell
            
            # Col 2 & 3: LMT and CMT formulas (=SUM of bank LMs, =SUM of bank CMs)
            lm_cols_str = []
            cm_cols_str = []
            
            p_banks = p.get("banks", {})
            c_col = 4
            for b in banks:
                b_id = b["id"]
                b_vals = p_banks.get(b_id, {"lm": 0, "cm": 0})
                lm_val = b_vals.get("lm", 0)
                cm_val = b_vals.get("cm", 0)
                
                # LM
                cell_p_lm = ws1.cell(row=row_idx, column=c_col, value=lm_val)
                cell_p_lm.font = font_partner
                cell_p_lm.alignment = align_right
                cell_p_lm.border = border_cell
                cell_p_lm.number_format = "#,##0"
                lm_cols_str.append(f"{get_column_letter(c_col)}{row_idx}")
                
                # CM
                cell_p_cm = ws1.cell(row=row_idx, column=c_col + 1, value=cm_val)
                cell_p_cm.font = font_partner
                cell_p_cm.alignment = align_right
                cell_p_cm.border = border_cell
                cell_p_cm.number_format = "#,##0"
                cm_cols_str.append(f"{get_column_letter(c_col + 1)}{row_idx}")
                
                c_col += 2
                
            # LMT formula
            ws1.cell(row=row_idx, column=2, value=f"={'+'.join(lm_cols_str)}")
            ws1.cell(row=row_idx, column=2).font = font_partner
            ws1.cell(row=row_idx, column=2).alignment = align_right
            ws1.cell(row=row_idx, column=2).border = border_cell
            ws1.cell(row=row_idx, column=2).number_format = "#,##0"
            
            # CMT formula
            ws1.cell(row=row_idx, column=3, value=f"={'+'.join(cm_cols_str)}")
            ws1.cell(row=row_idx, column=3).font = font_partner
            ws1.cell(row=row_idx, column=3).alignment = align_right
            ws1.cell(row=row_idx, column=3).border = border_cell
            ws1.cell(row=row_idx, column=3).number_format = "#,##0"
            
            # Alternating background for partner rows
            if p_idx % 2 == 1:
                for c in range(1, c_col):
                    ws1.cell(row=row_idx, column=c).fill = fill_even_row
                    
            ws1.row_dimensions[row_idx].height = 19
            row_idx += 1
            
        partner_end_row = row_idx - 1
        
        # Now fill the Manager Row (mgr_row_num) with light orange highlight & SUM formulas
        ws1.cell(row=mgr_row_num, column=1, value=f"★ MANAGER: {mgr_name}")
        ws1.cell(row=mgr_row_num, column=1).font = font_manager
        ws1.cell(row=mgr_row_num, column=1).fill = fill_manager
        ws1.cell(row=mgr_row_num, column=1).alignment = align_left
        ws1.cell(row=mgr_row_num, column=1).border = border_manager
        
        total_cols = 3 + len(banks) * 2
        for col_i in range(2, total_cols + 1):
            cell_m = ws1.cell(row=mgr_row_num, column=col_i)
            cell_m.font = font_manager
            cell_m.fill = fill_manager
            cell_m.alignment = align_right
            cell_m.border = border_manager
            cell_m.number_format = "#,##0"
            
            col_letter = get_column_letter(col_i)
            if partner_start_row <= partner_end_row:
                cell_m.value = f"=SUM({col_letter}{partner_start_row}:{col_letter}{partner_end_row})"
            else:
                cell_m.value = 0
                
        ws1.row_dimensions[mgr_row_num].height = 22
        
    # Grand Total Row
    grand_total_row = row_idx
    ws1.cell(row=grand_total_row, column=1, value="GRAND TOTAL")
    ws1.cell(row=grand_total_row, column=1).font = font_grand_total
    ws1.cell(row=grand_total_row, column=1).fill = fill_grand_total
    ws1.cell(row=grand_total_row, column=1).alignment = align_left
    ws1.cell(row=grand_total_row, column=1).border = border_grand_total
    
    total_cols = 3 + len(banks) * 2
    for col_i in range(2, total_cols + 1):
        cell_gt = ws1.cell(row=grand_total_row, column=col_i)
        cell_gt.font = font_grand_total
        cell_gt.fill = fill_grand_total
        cell_gt.alignment = align_right
        cell_gt.border = border_grand_total
        cell_gt.number_format = "#,##0"
        
        col_letter = get_column_letter(col_i)
        if manager_row_indices:
            mgr_cell_refs = [f"{col_letter}{r}" for r in manager_row_indices]
            cell_gt.value = f"={'+'.join(mgr_cell_refs)}"
        else:
            cell_gt.value = 0
            
    ws1.row_dimensions[grand_total_row].height = 24
    
    # Auto-fit column widths
    ws1.column_dimensions['A'].width = 44
    ws1.column_dimensions['B'].width = 12
    ws1.column_dimensions['C'].width = 12
    for col_i in range(4, total_cols + 1):
        ws1.column_dimensions[get_column_letter(col_i)].width = 10

    # Setup Sheet 2: Working Capital & Partner Profiles
    ws2 = wb.create_sheet(title="Working Capital & Bank Summary")
    ws2.views.sheetView[0].showGridLines = True
    
    ws2.merge_cells("A1:D1")
    ws2["A1"] = "Channel Partner Working Capital Allocation"
    ws2["A1"].font = font_title
    ws2.row_dimensions[1].height = 26
    
    ws2["A2"] = "SR NO"
    ws2["B2"] = "CHANNEL PARTNER"
    ws2["C2"] = "WORKING CAPITAL (₹)"
    ws2["D2"] = "TOTAL CARDS (CM)"
    for col, txt in enumerate(["A2", "B2", "C2", "D2"], 1):
        ws2[txt].font = font_header
        ws2[txt].fill = fill_header
        ws2[txt].alignment = align_center
        ws2[txt].border = border_cell
        
    wc_data = data.get("working_capital", {})
    r_idx = 3
    for s_no, (cp_name, cap_amt) in enumerate(wc_data.items(), 1):
        ws2.cell(row=r_idx, column=1, value=s_no).alignment = align_center
        ws2.cell(row=r_idx, column=2, value=cp_name).alignment = align_left
        ws2.cell(row=r_idx, column=3, value=cap_amt).alignment = align_right
        ws2.cell(row=r_idx, column=3).number_format = "₹#,##,##0"
        
        # Find CP in data for card count
        cp_cards = 0
        for mgr in managers:
            for p in mgr.get("partners", []):
                if p.get("name", "").strip().lower() == cp_name.strip().lower():
                    cp_cards = p.get("cmt", 0)
                    break
        ws2.cell(row=r_idx, column=4, value=cp_cards).alignment = align_right
        
        for c in range(1, 5):
            ws2.cell(row=r_idx, column=c).border = border_cell
            ws2.cell(row=r_idx, column=c).font = font_partner
        r_idx += 1
        
    ws2.column_dimensions['A'].width = 10
    ws2.column_dimensions['B'].width = 46
    ws2.column_dimensions['C'].width = 24
    ws2.column_dimensions['D'].width = 18

    # Bank Status Table on Sheet 2
    ws2.merge_cells("F1:H1")
    ws2["F1"] = "Bank Settlement Status"
    ws2["F1"].font = font_title
    
    ws2["F2"] = "SR NO"
    ws2["G2"] = "BANK NAME"
    ws2["H2"] = "SETTLEMENT STATUS"
    for txt in ["F2", "G2", "H2"]:
        ws2[txt].font = font_header
        ws2[txt].fill = fill_header
        ws2[txt].alignment = align_center
        ws2[txt].border = border_cell
        
    b_statuses = data.get("bank_statuses", {})
    br_idx = 3
    for s_no, (b_name, b_stat) in enumerate(b_statuses.items(), 1):
        ws2.cell(row=br_idx, column=6, value=s_no).alignment = align_center
        ws2.cell(row=br_idx, column=7, value=b_name).alignment = align_left
        ws2.cell(row=br_idx, column=8, value=b_stat).alignment = align_center
        for c in range(6, 9):
            ws2.cell(row=br_idx, column=c).border = border_cell
            ws2.cell(row=br_idx, column=c).font = font_partner
        br_idx += 1
        
    ws2.column_dimensions['F'].width = 10
    ws2.column_dimensions['G'].width = 20
    ws2.column_dimensions['H'].width = 20

    wb.save(output_path)
    return output_path
