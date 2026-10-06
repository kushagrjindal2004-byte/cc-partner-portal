with open("index.html", "r", encoding="utf-8") as f:
    html = f.read()

# Add a sanitizeSupabaseUrl function that strips /rest/v1 and trailing slashes
sanitize_logic = """        function cleanSupabaseUrl(url) {
            if (!url) return "";
            let cleaned = url.trim();
            // Remove /rest/v1 or /rest/v1/
            cleaned = cleaned.replace(/\\/rest\\/v1\\/?$/i, "");
            // Remove trailing slashes
            cleaned = cleaned.replace(/\\/+$/, "");
            return cleaned;
        }"""

# Update initSupabase to clean the URL
old_init = """        function initSupabase() {
            const savedUrl = localStorage.getItem("sb_url") || "https://zcsijzfhrsjnmgrtupqd.supabase.co";
            const savedKey = localStorage.getItem("sb_key");

            if (savedUrl && savedKey) {
                try {
                    supabaseClient = supabase.createClient(savedUrl, savedKey);"""

new_init = """        function cleanSupabaseUrl(url) {
            if (!url) return "";
            let cleaned = url.trim();
            cleaned = cleaned.replace(/\\/rest\\/v1\\/?$/i, "");
            cleaned = cleaned.replace(/\\/+$/, "");
            return cleaned;
        }

        function initSupabase() {
            let savedUrl = localStorage.getItem("sb_url") || "https://zcsijzfhrsjnmgrtupqd.supabase.co";
            savedUrl = cleanSupabaseUrl(savedUrl);
            localStorage.setItem("sb_url", savedUrl);
            const savedKey = localStorage.getItem("sb_key");

            if (savedUrl && savedKey) {
                try {
                    supabaseClient = supabase.createClient(savedUrl, savedKey);"""

html = html.replace(old_init, new_init)

# Also update handleSaveSettings to clean URL on save
old_save = """            const url = document.getElementById("supabaseUrlInput").value.trim();
            const key = document.getElementById("supabaseKeyInput").value.trim();
            if (url && key) {
                localStorage.setItem("sb_url", url);"""

new_save = """            let url = document.getElementById("supabaseUrlInput").value.trim();
            url = cleanSupabaseUrl(url);
            const key = document.getElementById("supabaseKeyInput").value.trim();
            if (url && key) {
                localStorage.setItem("sb_url", url);"""

html = html.replace(old_save, new_save)

with open("index.html", "w", encoding="utf-8") as f:
    f.write(html)

with open("templates/index.html", "w", encoding="utf-8") as f:
    f.write(html)

print("Added automatic URL sanitization to strip /rest/v1 from Supabase URL!")
