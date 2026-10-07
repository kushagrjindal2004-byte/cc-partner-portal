import json
import re

with open("index.html", "r", encoding="utf-8") as f:
    html = f.read()

# 1. Add Month Selector to Top Navigation
month_selector_html = """                <!-- Month Selector -->
                <div class="flex items-center bg-slate-800 border border-slate-700 rounded-lg px-2.5 py-1">
                    <i class="fa-regular fa-calendar text-orange-400 mr-2 text-xs"></i>
                    <label class="text-xs text-slate-400 mr-1.5 font-medium">Cycle:</label>
                    <select id="monthSelector" onchange="handleMonthChange(this.value)" class="bg-slate-900 text-amber-300 text-xs font-bold rounded px-2 py-1 border border-slate-600 focus:outline-none focus:ring-1 focus:ring-orange-500">
                        <option value="2026-09" selected>September 2026</option>
                        <option value="2026-10">October 2026</option>
                        <option value="2026-08">August 2026</option>
                    </select>
                    <button id="adminNewMonthBtn" onclick="openNewMonthModal()" title="Start New Month Cycle / Roll Forward" class="ml-1.5 p-1 bg-orange-600/30 hover:bg-orange-600 text-orange-200 hover:text-white rounded text-[11px] transition">
                        <i class="fa-solid fa-plus"></i>
                    </button>
                </div>"""

# Replace in top bar
if 'id="monthSelector"' not in html:
    html = html.replace('<!-- User / Manager Switcher -->', month_selector_html + '\n                <!-- User / Manager Switcher -->')

# 2. Add New Month Modal
new_month_modal = """
    <!-- MODAL: Start New Month Cycle / Rollover -->
    <div id="newMonthModal" class="fixed inset-0 bg-black/50 z-50 hidden flex items-center justify-center p-4">
        <div class="bg-white rounded-2xl max-w-md w-full p-6 shadow-2xl space-y-4">
            <div class="flex items-center justify-between">
                <h3 class="font-bold text-slate-800 text-base flex items-center gap-2">
                    <i class="fa-regular fa-calendar-plus text-orange-600"></i>
                    <span>Start New Month Cycle</span>
                </h3>
                <button onclick="closeNewMonthModal()" class="text-slate-400 hover:text-slate-600"><i class="fa-solid fa-xmark text-lg"></i></button>
            </div>

            <p class="text-xs text-slate-500">Create a new monthly tracking period. You can optionally roll forward previous Current Month (CM) counts into Last Month (LM) counts.</p>

            <form onsubmit="handleCreateNewMonth(event)" class="space-y-3.5">
                <div>
                    <label class="text-xs font-bold text-slate-700 block mb-1">Month Code (YYYY-MM) *</label>
                    <input type="text" id="newMonthCode" required placeholder="e.g. 2026-10" value="2026-10" class="w-full text-xs font-semibold p-2.5 bg-slate-50 border border-slate-300 rounded-lg focus:ring-2 focus:ring-orange-500">
                </div>

                <div>
                    <label class="text-xs font-bold text-slate-700 block mb-1">Month Display Name *</label>
                    <input type="text" id="newMonthLabel" required placeholder="e.g. October 2026" value="October 2026" class="w-full text-xs font-semibold p-2.5 bg-slate-50 border border-slate-300 rounded-lg focus:ring-2 focus:ring-orange-500">
                </div>

                <div class="p-3 bg-amber-50 rounded-xl border border-amber-200 text-xs space-y-2">
                    <label class="flex items-start gap-2 cursor-pointer">
                        <input type="checkbox" id="rolloverPreviousCM" checked class="mt-0.5 text-orange-600 rounded">
                        <span class="text-amber-900 font-medium">Auto-roll current month numbers as new Last Month (LM) baseline, and reset Current Month (CM) to 0.</span>
                    </label>
                </div>

                <div class="pt-2 flex items-center justify-end gap-2">
                    <button type="button" onclick="closeNewMonthModal()" class="px-4 py-2 text-xs font-semibold text-slate-600 hover:bg-slate-100 rounded-lg">Cancel</button>
                    <button type="submit" class="px-4 py-2 text-xs font-bold text-white bg-orange-600 hover:bg-orange-700 rounded-lg shadow-sm">Create Month Cycle</button>
                </div>
            </form>
        </div>
    </div>
"""

if '<div id="newMonthModal"' not in html:
    html = html.replace('<div id="toast"', new_month_modal + '\n    <div id="toast"')

# 3. Add Client-Side Excel Exporter & Month Management Script
client_excel_and_month_js = """
        let currentActiveMonth = "2026-09";
        let availableMonths = [
            { code: "2026-09", label: "September 2026" },
            { code: "2026-10", label: "October 2026" },
            { code: "2026-08", label: "August 2026" }
        ];

        // Month Selection Handler
        function handleMonthChange(monthCode) {
            currentActiveMonth = monthCode;
            showToast(`Switched to month cycle: ${monthCode}`, "info");
            loadDatabaseData();
        }

        function openNewMonthModal() {
            document.getElementById("newMonthModal").classList.remove("hidden");
        }
        function closeNewMonthModal() {
            document.getElementById("newMonthModal").classList.add("hidden");
        }

        async function handleCreateNewMonth(e) {
            e.preventDefault();
            const monthCode = document.getElementById("newMonthCode").value.trim();
            const monthLabel = document.getElementById("newMonthLabel").value.trim();
            const doRollover = document.getElementById("rolloverPreviousCM").checked;

            if (!monthCode || !monthLabel) return;

            // Add to available months
            if (!availableMonths.find(m => m.code === monthCode)) {
                availableMonths.unshift({ code: monthCode, label: monthLabel });
            }

            // Update dropdown
            renderMonthDropdown();
            currentActiveMonth = monthCode;
            document.getElementById("monthSelector").value = monthCode;

            // Roll forward data if requested
            if (doRollover) {
                const newIssuances = [];
                dbData.managers.forEach(m => {
                    m.partners.forEach(p => {
                        dbData.banks.forEach(b => {
                            const prevCM = p.banks?.[b.id]?.cm || 0;
                            p.banks[b.id] = { lm: prevCM, cm: 0 };
                            if (p.id && b.id) {
                                newIssuances.push({
                                    partner_id: p.id,
                                    bank_id: b.id,
                                    month_year: monthCode,
                                    lm_count: prevCM,
                                    cm_count: 0
                                });
                            }
                        });
                    });
                });

                recalculateAll();
                renderAll();

                // Persist new month records to Supabase
                if (supabaseClient && newIssuances.length > 0) {
                    try {
                        const { error } = await supabaseClient.from('card_issuances').upsert(newIssuances, { onConflict: 'partner_id,bank_id,month_year' });
                        if (error) throw error;
                        showToast(`New month ${monthLabel} initialized with Supabase!`, "success");
                    } catch (err) {
                        console.error("Supabase month init error:", err);
                        showToast("Created locally: " + err.message, "info");
                    }
                }
            }

            closeNewMonthModal();
            showToast(`Started new month cycle: ${monthLabel}`, "success");
        }

        function renderMonthDropdown() {
            const select = document.getElementById("monthSelector");
            if (!select) return;
            select.innerHTML = availableMonths.map(m => `
                <option value="${m.code}" ${m.code === currentActiveMonth ? 'selected' : ''}>${m.label}</option>
            `).join("");
        }

        // ==========================================
        // 100% CLIENT-SIDE EXCEL EXPORTER (SheetJS)
        // Works everywhere: Vercel, Localhost, Mobile
        // ==========================================
        function exportToExcelClientSide() {
            try {
                showToast("Generating formatted Excel workbook...", "info");

                const banks = dbData.banks || [];
                const managersToShow = activeRole === "ADMIN" ? dbData.managers : dbData.managers.filter(m => m.manager_name === activeRole);

                // Build Master Sheet Rows
                const masterRows = [];

                // Row 1: Title
                const monthObj = availableMonths.find(m => m.code === currentActiveMonth) || { label: currentActiveMonth };
                masterRows.push([`Credit Card Issuance & Partner Performance Portal - Month: ${monthObj.label}`]);
                masterRows.push([]); // blank

                // Header Row 1 (Bank Names)
                const header1 = ["PARTNERS / MANAGERS", "TOTAL CARDS", ""];
                banks.forEach(b => {
                    header1.push(`${b.name} (${b.status || 'FINAL'})`);
                    header1.push(""); // for CM span
                });
                masterRows.push(header1);

                // Header Row 2 (LMT, CMT, LM, CM)
                const header2 = ["", "LMT", "CMT"];
                banks.forEach(() => {
                    header2.push("LM");
                    header2.push("CM");
                });
                masterRows.push(header2);

                let grandLMT = 0, grandCMT = 0;
                let grandBankTotals = {};
                banks.forEach(b => grandBankTotals[b.id] = { lm: 0, cm: 0 });

                // Data Rows
                managersToShow.forEach(mgr => {
                    let mgrLMT = 0, mgrCMT = 0;
                    let mgrBankTotals = {};
                    banks.forEach(b => mgrBankTotals[b.id] = { lm: 0, cm: 0 });

                    mgr.partners.forEach(p => {
                        mgrLMT += p.lmt || 0;
                        mgrCMT += p.cmt || 0;
                        banks.forEach(b => {
                            mgrBankTotals[b.id].lm += p.banks?.[b.id]?.lm || 0;
                            mgrBankTotals[b.id].cm += p.banks?.[b.id]?.cm || 0;
                        });
                    });

                    grandLMT += mgrLMT;
                    grandCMT += mgrCMT;
                    banks.forEach(b => {
                        grandBankTotals[b.id].lm += mgrBankTotals[b.id].lm;
                        grandBankTotals[b.id].cm += mgrBankTotals[b.id].cm;
                    });

                    // Manager Header Row
                    const mgrRow = [`★ MANAGER: ${mgr.manager_name}`, mgrLMT, mgrCMT];
                    banks.forEach(b => {
                        mgrRow.push(mgrBankTotals[b.id].lm);
                        mgrRow.push(mgrBankTotals[b.id].cm);
                    });
                    masterRows.push(mgrRow);

                    // Partner Rows
                    mgr.partners.forEach(p => {
                        const pRow = [`    ${p.name}`, p.lmt || 0, p.cmt || 0];
                        banks.forEach(b => {
                            pRow.push(p.banks?.[b.id]?.lm || 0);
                            pRow.push(p.banks?.[b.id]?.cm || 0);
                        });
                        masterRows.push(pRow);
                    });
                });

                // Grand Total Row
                const gtRow = ["GRAND TOTAL ROLLUP", grandLMT, grandCMT];
                banks.forEach(b => {
                    gtRow.push(grandBankTotals[b.id].lm);
                    gtRow.push(grandBankTotals[b.id].cm);
                });
                masterRows.push(gtRow);

                // Build Workbook
                const wb = XLSX.utils.book_new();
                const ws1 = XLSX.utils.aoa_to_sheet(masterRows);

                // Set Column Widths
                const colWidths = [{ wch: 38 }, { wch: 10 }, { wch: 10 }];
                banks.forEach(() => {
                    colWidths.push({ wch: 8 });
                    colWidths.push({ wch: 8 });
                });
                ws1['!cols'] = colWidths;

                // Merge Cells for Bank Headers
                const merges = [
                    { s: { r: 0, c: 0 }, e: { r: 0, c: 2 + banks.length * 2 } }, // Title
                    { s: { r: 2, c: 1 }, e: { r: 2, c: 2 } } // TOTAL CARDS
                ];
                banks.forEach((b, idx) => {
                    const cStart = 3 + idx * 2;
                    merges.push({ s: { r: 2, c: cStart }, e: { r: 2, c: cStart + 1 } });
                });
                ws1['!merges'] = merges;

                XLSX.utils.book_append_sheet(wb, ws1, "CC Issuance Master");

                // Sheet 2: Working Capital Summary
                const wcRows = [
                    ["Channel Partner Working Capital & Efficiency Summary"],
                    [],
                    ["SR NO", "CHANNEL PARTNER", "MANAGER", "WORKING CAPITAL (₹)", "CURRENT MONTH CARDS"]
                ];
                let sNo = 1;
                managersToShow.forEach(m => {
                    m.partners.forEach(p => {
                        if (p.working_capital > 0 || p.cmt > 0) {
                            wcRows.push([sNo++, p.name, m.manager_name, p.working_capital || 0, p.cmt || 0]);
                        }
                    });
                });
                const ws2 = XLSX.utils.aoa_to_sheet(wcRows);
                ws2['!cols'] = [{ wch: 8 }, { wch: 36 }, { wch: 22 }, { wch: 20 }, { wch: 18 }];
                XLSX.utils.book_append_sheet(wb, ws2, "Working Capital");

                // Download File
                const filename = `Credit_Card_Issuance_${monthObj.label.replace(/\\s+/g, '_')}.xlsx`;
                XLSX.writeFile(wb, filename);
                showToast(`Downloaded ${filename} successfully!`, "success");
            } catch (err) {
                console.error("Client excel export error:", err);
                showToast("Excel export error: " + err.message, "error");
            }
        }
"""

# Replace old exportToExcelClientSide and add Month management
old_export_func = """        function exportToExcelClientSide() {
            window.location.href = "/api/export-excel";
        }"""

if old_export_func in html:
    html = html.replace(old_export_func, client_excel_and_month_js)

# Also update loadDatabaseData to filter by currentActiveMonth
old_issuance_fetch = 'supabaseClient.from("card_issuances").select("*")'
new_issuance_fetch = 'supabaseClient.from("card_issuances").select("*").eq("month_year", currentActiveMonth)'

if old_issuance_fetch in html:
    html = html.replace(old_issuance_fetch, new_issuance_fetch)

# Also update updateCellDirectly to use currentActiveMonth
old_month_hardcoded = "month_year: '2026-09'"
new_month_dynamic = "month_year: currentActiveMonth"
html = html.replace(old_month_hardcoded, new_month_dynamic)

with open("index.html", "w", encoding="utf-8") as f:
    f.write(html)

with open("templates/index.html", "w", encoding="utf-8") as f:
    f.write(html)

print("Added Month-Wise selector, rollover cycle, and client-side SheetJS Excel exporter!")
