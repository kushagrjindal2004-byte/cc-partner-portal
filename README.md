# Credit Card Issuance & Partner Management Portal (Supabase Connected)

A modern, database-first web application designed to track Channel Partner (CP) Credit Card Issuance across multiple banks, calculate automatic Manager Roll-ups with light orange highlights, and deliver real-time bank and timeline insights.

---

## 🚀 Quick Setup with Supabase (Free Tier)

### Step 1: Create a Supabase Project
1. Log in to [Supabase](https://supabase.com/dashboard).
2. Click **"New Project"**.
3. Name it (e.g., `cc-partner-portal`), enter a secure database password, and pick a nearby region (e.g., *South Asia / Mumbai*).
4. Click **"Create new project"** (takes ~60 seconds to provision).

---

### Step 2: Run the SQL Database Setup
1. In your Supabase Dashboard, click on **"SQL Editor"** on the left menu (icon: `>_`).
2. Click **"+ New Query"**.
3. Open [`supabase_schema_and_data.sql`](supabase_schema_and_data.sql) in this folder, **Copy all contents**, and **Paste** into the Supabase SQL editor.
4. Click **"Run"** (bottom right).
   - This automatically creates the tables, roll-up views, security rules, and pre-populates all **136 Channel Partners**, **8 Managers**, **11 Banks**, and all September/August issuance counts!

---

### Step 3: Copy Your Supabase API Keys
1. In Supabase, go to **Project Settings** (gear icon ⚙️ at bottom left) ➔ **API** (or **Data API**).
2. Copy two values:
   - **Project URL** (e.g., `https://abcdefghijkl.supabase.co`)
   - **anon / public key** (e.g., `eyJhbGciOi...`)

---

### Step 4: Launch & Connect the Portal
1. Run the local portal:
   ```bash
   python app.py
   ```
2. Open your browser at `http://127.0.0.1:5000`.
3. Click the **"Supabase Settings"** button in the top navigation bar.
4. Paste your **Project URL** and **Anon Key**, then click **"Save & Connect"**.
5. Your portal is now 100% connected directly to Supabase PostgreSQL!

---

## 🌟 Key Features

1. **Manager Hierarchy & Roll-Up Sums**:
   - Every manager section is highlighted in **Standard Light Orange** (`#FED7AA`).
   - The manager row automatically calculates the live sum of all Channel Partners under that manager for every bank.

2. **Manager Login & Filtering**:
   - Switch between **👑 Backend Admin (All Managers)** or any individual Manager (*Azam, Bhavani, Binod Mishra, Divyam, Vinay Pandey, Alkesh Shukla, Zeeshan Haider*).
   - When a manager is selected, only their respective CPs and team statistics are shown.

3. **Dedicated Insights Page**:
   - **Cards Issued per Bank**: LM vs CM comparison and volume share % for all 11+ banks.
   - **Cards per Channel Partner**: Leaderboards showing top performing CPs and their primary banks.
   - **Timeline & Settlement Cycle**: Settlement cutoff milestones (e.g., *Axis LIC 21st* cutoff vs Month-end final cycles).

4. **Zero Excel Dependency**:
   - Edits update the Supabase PostgreSQL database directly in real-time.
   - Excel export (`.xlsx`) is available via the **"Export .xlsx"** button whenever an offline file is needed.
