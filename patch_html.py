import json

with open("initial_data.json", "r", encoding="utf-8") as f:
    initial_data = json.load(f)

# Filter out empty manager placeholder if any
initial_data["managers"] = [m for m in initial_data.get("managers", []) if m.get("partners")]

with open("index.html", "r", encoding="utf-8") as f:
    html_content = f.read()

# Replace loadLocalDataFallback
fallback_js = f"""
        const EMBEDDED_FALLBACK_DATA = {json.dumps(initial_data, ensure_ascii=False)};

        async function loadLocalDataFallback() {{
            try {{
                const res = await fetch("/api/data");
                if (res.ok) {{
                    const json = await res.json();
                    if (json.success) {{
                        dbData = json.data;
                        recalculateAll();
                        renderAll();
                        return;
                    }}
                }}
            }} catch (e) {{
                console.warn("Using embedded fallback dataset:", e);
            }}
            dbData = JSON.parse(JSON.stringify(EMBEDDED_FALLBACK_DATA));
            recalculateAll();
            renderAll();
        }}
"""

target_snippet = """        async function loadLocalDataFallback() {
            try {
                const res = await fetch("/api/data");
                const json = await res.json();
                if (json.success) {
                    dbData = json.data;
                    recalculateAll();
                    renderAll();
                }
            } catch (e) {
                console.error("Fallback load error:", e);
            }
        }"""

if target_snippet in html_content:
    html_content = html_content.replace(target_snippet, fallback_js)

# Also update error message reporting in loadDatabaseData
error_update_target = """                if (bErr || mErr) {
                    console.error("Supabase load error:", bErr || mErr);
                    showToast("Database fetch error, using local cache", "error");
                    loadLocalDataFallback();
                    return;
                }"""

error_update_replacement = """                if (bErr || mErr) {
                    const errDetail = (bErr ? bErr.message : '') || (mErr ? mErr.message : '');
                    console.error("Supabase load error:", bErr || mErr);
                    if (errDetail.includes("relation") || errDetail.includes("does not exist") || errDetail.includes("404")) {
                        showToast("Tables not found in Supabase. Please run the SQL in Supabase SQL Editor!", "error");
                    } else {
                        showToast("Supabase: " + errDetail, "error");
                    }
                    loadLocalDataFallback();
                    return;
                }"""

if error_update_target in html_content:
    html_content = html_content.replace(error_update_target, error_update_replacement)

with open("index.html", "w", encoding="utf-8") as f:
    f.write(html_content)

with open("templates/index.html", "w", encoding="utf-8") as f:
    f.write(html_content)

print("Updated index.html and templates/index.html with embedded fallback and improved diagnostics!")
