import os
import json
import csv
import io
from flask import Flask, render_template, request, jsonify, send_file, redirect, url_for
from excel_exporter import generate_excel_file
from openpyxl import load_workbook

app = Flask(__name__)
DATA_FILE = os.path.join(os.path.dirname(__file__), "portal_data.json")
INITIAL_DATA_FILE = os.path.join(os.path.dirname(__file__), "initial_data.json")

def load_data():
    """Load portal data from persistent file, or fallback to initial_data.json."""
    if os.path.exists(DATA_FILE):
        try:
            with open(DATA_FILE, "r", encoding="utf-8") as f:
                return json.load(f)
        except Exception as e:
            print(f"Error loading data file: {e}")
    
    if os.path.exists(INITIAL_DATA_FILE):
        with open(INITIAL_DATA_FILE, "r", encoding="utf-8") as f:
            data = json.load(f)
            # Filter out any manager with 0 partners that is just a duplicate grand total placeholder
            data["managers"] = [m for m in data.get("managers", []) if m.get("partners") or m.get("manager_name") != "INAYA" or len(data.get("managers", [])) <= 1]
            save_data(data)
            return data
            
    # Default skeleton if neither exists
    return {
        "title": "Credit Card Issuance & Partner Performance Portal",
        "last_month_name": "August 2026",
        "current_month_name": "September 2026",
        "banks": [
            {"id": "au", "name": "AU", "status": "FINAL"},
            {"id": "axis", "name": "AXIS", "status": "FINAL"},
            {"id": "axis_lic", "name": "AXIS LIC", "status": "21-SEP"},
            {"id": "hdfc", "name": "HDFC", "status": "FINAL"},
            {"id": "indus", "name": "INDUS", "status": "FINAL"},
            {"id": "sbi", "name": "SBI", "status": "FINAL"},
            {"id": "tata_neu", "name": "TATA NEU", "status": "FINAL"},
            {"id": "kiwi", "name": "KIWI", "status": "FINAL"},
            {"id": "bob", "name": "BOB", "status": "FINAL"},
            {"id": "yes_zaggle", "name": "YES ZAGGLE", "status": "FINAL"},
            {"id": "rbl", "name": "RBL", "status": "FINAL"}
        ],
        "managers": [],
        "working_capital": {},
        "bank_statuses": {}
    }

def save_data(data):
    """Save data to persistent storage."""
    with open(DATA_FILE, "w", encoding="utf-8") as f:
        json.dump(data, f, indent=2, ensure_ascii=False)

def recalculate_totals(data):
    """Recalculates all partner totals, manager sums, and grand totals."""
    banks = data.get("banks", [])
    managers = data.get("managers", [])
    
    for mgr in managers:
        for p in mgr.get("partners", []):
            p_banks = p.get("banks", {})
            lmt = sum(p_banks.get(b["id"], {}).get("lm", 0) for b in banks)
            cmt = sum(p_banks.get(b["id"], {}).get("cm", 0) for b in banks)
            p["lmt"] = lmt
            p["cmt"] = cmt
            
    return data

@app.route("/")
def index():
    return render_template("index.html")

@app.route("/api/data", methods=["GET"])
def get_data():
    data = load_data()
    data = recalculate_totals(data)
    return jsonify({"success": True, "data": data})

@app.route("/api/save", methods=["POST"])
def save_portal_data():
    try:
        new_data = request.json
        if not new_data:
            return jsonify({"success": False, "error": "No data received"}), 400
        new_data = recalculate_totals(new_data)
        save_data(new_data)
        return jsonify({"success": True, "message": "Portal data saved successfully!"})
    except Exception as e:
        return jsonify({"success": False, "error": str(e)}), 500

@app.route("/api/update-partner-cell", methods=["POST"])
def update_partner_cell():
    try:
        req = request.json
        mgr_name = req.get("manager_name")
        partner_name = req.get("partner_name")
        bank_id = req.get("bank_id") # e.g. 'hdfc' or 'name'
        field = req.get("field") # 'lm', 'cm', or 'name'
        value = req.get("value")
        
        data = load_data()
        updated = False
        
        for mgr in data.get("managers", []):
            if mgr.get("manager_name") == mgr_name:
                for p in mgr.get("partners", []):
                    if p.get("name") == partner_name:
                        if field == "name":
                            p["name"] = str(value).strip()
                        elif bank_id:
                            if "banks" not in p:
                                p["banks"] = {}
                            if bank_id not in p["banks"]:
                                p["banks"][bank_id] = {"lm": 0, "cm": 0}
                            try:
                                p["banks"][bank_id][field] = int(value) if str(value).strip() != "" else 0
                            except ValueError:
                                p["banks"][bank_id][field] = 0
                        updated = True
                        break
                if updated:
                    break
                    
        if updated:
            data = recalculate_totals(data)
            save_data(data)
            return jsonify({"success": True, "data": data})
        else:
            return jsonify({"success": False, "error": "Partner or Manager not found"}), 404
    except Exception as e:
        return jsonify({"success": False, "error": str(e)}), 500

@app.route("/api/add-partner", methods=["POST"])
def add_partner():
    try:
        req = request.json
        mgr_name = req.get("manager_name")
        partner_name = req.get("partner_name", "").strip()
        working_capital = req.get("working_capital", 0)
        
        if not mgr_name or not partner_name:
            return jsonify({"success": False, "error": "Manager name and Partner name are required"}), 400
            
        data = load_data()
        banks = data.get("banks", [])
        
        # Check if manager exists
        target_mgr = None
        for mgr in data.get("managers", []):
            if mgr.get("manager_name") == mgr_name:
                target_mgr = mgr
                break
                
        if not target_mgr:
            return jsonify({"success": False, "error": f"Manager '{mgr_name}' not found"}), 404
            
        # Create new partner
        new_partner = {
            "name": partner_name,
            "lmt": 0,
            "cmt": 0,
            "banks": {b["id"]: {"lm": 0, "cm": 0} for b in banks}
        }
        
        target_mgr["partners"].append(new_partner)
        
        if working_capital and int(working_capital) > 0:
            if "working_capital" not in data:
                data["working_capital"] = {}
            data["working_capital"][partner_name] = int(working_capital)
            
        data = recalculate_totals(data)
        save_data(data)
        return jsonify({"success": True, "message": f"Partner '{partner_name}' added under Manager '{mgr_name}'", "data": data})
    except Exception as e:
        return jsonify({"success": False, "error": str(e)}), 500

@app.route("/api/add-manager", methods=["POST"])
def add_manager():
    try:
        req = request.json
        mgr_name = req.get("manager_name", "").strip()
        
        if not mgr_name:
            return jsonify({"success": False, "error": "Manager name is required"}), 400
            
        data = load_data()
        for mgr in data.get("managers", []):
            if mgr.get("manager_name").lower() == mgr_name.lower():
                return jsonify({"success": False, "error": f"Manager '{mgr_name}' already exists"}), 400
                
        data["managers"].append({
            "manager_name": mgr_name,
            "partners": []
        })
        
        save_data(data)
        return jsonify({"success": True, "message": f"Manager '{mgr_name}' created successfully!", "data": data})
    except Exception as e:
        return jsonify({"success": False, "error": str(e)}), 500

@app.route("/api/delete-partner", methods=["POST"])
def delete_partner():
    try:
        req = request.json
        mgr_name = req.get("manager_name")
        partner_name = req.get("partner_name")
        
        data = load_data()
        for mgr in data.get("managers", []):
            if mgr.get("manager_name") == mgr_name:
                mgr["partners"] = [p for p in mgr.get("partners", []) if p.get("name") != partner_name]
                break
                
        data = recalculate_totals(data)
        save_data(data)
        return jsonify({"success": True, "data": data})
    except Exception as e:
        return jsonify({"success": False, "error": str(e)}), 500

@app.route("/api/delete-manager", methods=["POST"])
def delete_manager():
    try:
        req = request.json
        mgr_name = req.get("manager_name")
        
        data = load_data()
        data["managers"] = [m for m in data.get("managers", []) if m.get("manager_name") != mgr_name]
        
        data = recalculate_totals(data)
        save_data(data)
        return jsonify({"success": True, "data": data})
    except Exception as e:
        return jsonify({"success": False, "error": str(e)}), 500

@app.route("/api/add-bank", methods=["POST"])
def add_bank():
    try:
        req = request.json
        bank_name = req.get("bank_name", "").strip()
        bank_status = req.get("bank_status", "FINAL").strip()
        
        if not bank_name:
            return jsonify({"success": False, "error": "Bank name is required"}), 400
            
        data = load_data()
        bank_id = bank_name.lower().replace(" ", "_")
        
        # Check if bank exists
        for b in data.get("banks", []):
            if b["id"] == bank_id or b["name"].lower() == bank_name.lower():
                return jsonify({"success": False, "error": "Bank already exists"}), 400
                
        data["banks"].append({
            "id": bank_id,
            "name": bank_name,
            "status": bank_status
        })
        
        # Initialize bank values for all partners
        for mgr in data.get("managers", []):
            for p in mgr.get("partners", []):
                if "banks" not in p:
                    p["banks"] = {}
                p["banks"][bank_id] = {"lm": 0, "cm": 0}
                
        data = recalculate_totals(data)
        save_data(data)
        return jsonify({"success": True, "message": f"Bank '{bank_name}' added successfully!", "data": data})
    except Exception as e:
        return jsonify({"success": False, "error": str(e)}), 500

@app.route("/api/export-excel", methods=["GET"])
def export_excel():
    try:
        data = load_data()
        data = recalculate_totals(data)
        output_file = os.path.join(os.path.dirname(__file__), "Credit_Card_Issuance_Master.xlsx")
        generate_excel_file(data, output_file)
        return send_file(output_file, as_attachment=True, download_name="Credit_Card_Issuance_Master.xlsx")
    except Exception as e:
        return jsonify({"success": False, "error": str(e)}), 500

@app.route("/api/reset-data", methods=["POST"])
def reset_data():
    try:
        if os.path.exists(INITIAL_DATA_FILE):
            with open(INITIAL_DATA_FILE, "r", encoding="utf-8") as f:
                data = json.load(f)
            # Remove empty manager header if any
            data["managers"] = [m for m in data.get("managers", []) if m.get("partners")]
            save_data(data)
            return jsonify({"success": True, "message": "Portal data reset to original dataset!", "data": data})
        return jsonify({"success": False, "error": "Initial data template not found"}), 404
    except Exception as e:
        return jsonify({"success": False, "error": str(e)}), 500

if __name__ == "__main__":
    print("Starting CC Issuance & Partner Management Portal on http://127.0.0.1:5000 ...")
    app.run(host="0.0.0.0", port=5000, debug=True)
