import json

SUPABASE_URL = "https://zcsijzfhrsjnmgrtupqd.supabase.co"
SUPABASE_KEY = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Inpjc2lqemZocnNqbm1ncnR1cHFkIiwicm9sZSI6ImFub24iLCJpYXQiOjE3OTEyODExODYsImV4cCI6MjEwNjg1NzE4Nn0.jj4havzFR3ts7_bZGRtMZcg4HFrw20t4ksQYdPRQ_i4"

with open("index.html", "r", encoding="utf-8") as f:
    html = f.read()

# Update initSupabase to use permanent hardcoded credentials as default
old_init_target = """        function initSupabase() {
            let savedUrl = localStorage.getItem("sb_url") || "https://zcsijzfhrsjnmgrtupqd.supabase.co";
            savedUrl = cleanSupabaseUrl(savedUrl);
            localStorage.setItem("sb_url", savedUrl);
            const savedKey = localStorage.getItem("sb_key");

            if (savedUrl && savedKey) {
                try {
                    supabaseClient = supabase.createClient(savedUrl, savedKey);
                    updateStatus(true, "Supabase Connected");
                    loadDatabaseData();
                    return;
                } catch (e) {
                    console.error("Supabase init error:", e);
                }
            }

            // Fallback: Load local JSON initial dataset for immediate testing
            updateStatus(false, "Demo Mode (Local Data)");
            loadLocalDataFallback();
        }"""

new_init_replacement = f"""        const DEFAULT_SUPABASE_URL = "{SUPABASE_URL}";
        const DEFAULT_SUPABASE_KEY = "{SUPABASE_KEY}";

        function initSupabase() {{
            let savedUrl = localStorage.getItem("sb_url") || DEFAULT_SUPABASE_URL;
            savedUrl = cleanSupabaseUrl(savedUrl);
            localStorage.setItem("sb_url", savedUrl);

            let savedKey = localStorage.getItem("sb_key") || DEFAULT_SUPABASE_KEY;
            localStorage.setItem("sb_key", savedKey);

            try {{
                supabaseClient = supabase.createClient(savedUrl, savedKey);
                updateStatus(true, "Supabase Connected");
                loadDatabaseData();
            }} catch (e) {{
                console.error("Supabase init error:", e);
                updateStatus(false, "Connection Error");
                loadLocalDataFallback();
            }}
        }}"""

if old_init_target in html:
    html = html.replace(old_init_target, new_init_replacement)
else:
    # Use regex replacement if needed
    import re
    pattern = r"function initSupabase\(\)\s*\{[\s\S]*?loadLocalDataFallback\(\);\s*\}"
    html = re.sub(pattern, new_init_replacement, html)

with open("index.html", "w", encoding="utf-8") as f:
    f.write(html)

with open("templates/index.html", "w", encoding="utf-8") as f:
    f.write(html)

print("Hardcoded permanent Supabase credentials into index.html and templates/index.html!")
