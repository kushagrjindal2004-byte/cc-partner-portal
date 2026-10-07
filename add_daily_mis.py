import re

with open("index.html", "r", encoding="utf-8") as f:
    html = f.read()

# 1. Add "Daily MIS" tab to navigation toolbar
old_tabs_nav = """            <!-- Tabs -->
            <div class="flex space-x-1">
                <button onclick="switchTab('sheetTab')" id="tabBtn-sheetTab" class="tab-btn px-3 py-1.5 text-xs font-semibold rounded bg-navy text-white transition">
                    Master Sheet
                </button>
                <button onclick="switchTab('insightsTab')" id="tabBtn-insightsTab" class="tab-btn px-3 py-1.5 text-xs font-medium text-ink-secondary hover:text-ink-primary hover:bg-slate-100 rounded transition">
                    Insights & Timeline
                </button>
                <button onclick="switchTab('adminTab')" id="tabBtn-adminTab" class="tab-btn px-3 py-1.5 text-xs font-medium text-ink-secondary hover:text-ink-primary hover:bg-slate-100 rounded transition">
                    Manage Data
                </button>
            </div>"""

new_tabs_nav = """            <!-- Tabs -->
            <div class="flex space-x-1">
                <button onclick="switchTab('sheetTab')" id="tabBtn-sheetTab" class="tab-btn px-3 py-1.5 text-xs font-semibold rounded bg-navy text-white transition flex items-center gap-1.5">
                    <i class="fa-solid fa-table-cells text-[11px]"></i>
                    <span>Master Sheet</span>
                </button>
                <button onclick="switchTab('dailyTab')" id="tabBtn-dailyTab" class="tab-btn px-3 py-1.5 text-xs font-medium text-ink-secondary hover:text-ink-primary hover:bg-slate-100 rounded transition flex items-center gap-1.5">
                    <i class="fa-regular fa-calendar-check text-[11px]"></i>
                    <span>Daily MIS</span>
                </button>
                <button onclick="switchTab('insightsTab')" id="tabBtn-insightsTab" class="tab-btn px-3 py-1.5 text-xs font-medium text-ink-secondary hover:text-ink-primary hover:bg-slate-100 rounded transition flex items-center gap-1.5">
                    <i class="fa-solid fa-chart-line text-[11px]"></i>
                    <span>Insights & Timeline</span>
                </button>
                <button onclick="switchTab('adminTab')" id="tabBtn-adminTab" class="tab-btn px-3 py-1.5 text-xs font-medium text-ink-secondary hover:text-ink-primary hover:bg-slate-100 rounded transition flex items-center gap-1.5">
                    <i class="fa-solid fa-sliders text-[11px]"></i>
                    <span>Manage Data</span>
                </button>
            </div>"""

html = html.replace(old_tabs_nav, new_tabs_nav)

# 2. Add TAB: Daily MIS Container HTML right after Master Sheet Tab
daily_mis_tab_html = """
        <!-- TAB: DAILY MIS (Date-to-Date Comparison & Daily Logging) -->
        <div id="dailyTab" class="tab-content hidden space-y-3">
            
            <!-- Daily MIS Control Toolbar -->
            <div class="bg-surface p-3 rounded-lg border border-border flex flex-wrap items-center justify-between gap-3">
                <div class="flex items-center gap-2">
                    <label class="text-xs font-semibold text-ink-primary flex items-center gap-1.5">
                        <i class="fa-regular fa-calendar text-navy"></i>
                        <span>Select Date:</span>
                    </label>
                    <input type="date" id="dailyMisDatePicker" onchange="handleDailyDateChange(this.value)" class="text-xs font-semibold p-1.5 bg-slate-50 border border-border rounded focus:border-navy focus:bg-white outline-none cursor-pointer">
                    
                    <div class="flex items-center space-x-1">
                        <button onclick="stepDailyDate(-1)" title="Previous Day" class="p-1.5 px-2 border border-border bg-white hover:bg-slate-50 text-ink-secondary rounded text-xs transition">
                            <i class="fa-solid fa-chevron-left text-[10px]"></i>
                        </button>
                        <button onclick="setDailyDateToday()" class="px-2 py-1 border border-border bg-white hover:bg-slate-50 text-ink-primary rounded text-xs font-medium transition">
                            Today
                        </button>
                        <button onclick="stepDailyDate(1)" title="Next Day" class="p-1.5 px-2 border border-border bg-white hover:bg-slate-50 text-ink-secondary rounded text-xs transition">
                            <i class="fa-solid fa-chevron-right text-[10px]"></i>
                        </button>
                    </div>
                </div>

                <!-- Comparison Tag & Export -->
                <div class="flex items-center gap-2.5">
                    <div class="bg-slate-100 border border-border text-ink-secondary text-xs px-2.5 py-1 rounded flex items-center gap-1.5">
                        <span class="w-1.5 h-1.5 rounded-full bg-navy"></span>
                        <span id="dailyComparisonLabel">Comparing 07-Oct-2026 vs 07-Sep-2026</span>
                    </div>

                    <button onclick="exportDailyMisExcelClientSide()" class="inline-flex items-center gap-1.5 bg-navy hover:bg-navy-700 text-white font-medium px-3 py-1 rounded text-xs shadow-sm transition">
                        <i class="fa-solid fa-file-excel text-[11px]"></i>
                        <span>Export Daily MIS (.xlsx)</span>
                    </button>
                </div>
            </div>

            <!-- Daily KPI Summary Strip -->
            <div class="grid grid-cols-3 gap-3">
                <div class="bg-surface rounded-lg p-2.5 px-3.5 border border-border">
                    <span class="text-[11px] font-medium text-ink-secondary block">Today's Total Issuance</span>
                    <h4 id="dailyTodayTotal" class="text-lg font-bold text-ink-primary mt-0.5">0</h4>
                </div>
                <div class="bg-surface rounded-lg p-2.5 px-3.5 border border-border">
                    <span class="text-[11px] font-medium text-ink-secondary block">Same Date Last Month</span>
                    <h4 id="dailyPrevDateTotal" class="text-lg font-bold text-ink-secondary mt-0.5">0</h4>
                </div>
                <div class="bg-surface rounded-lg p-2.5 px-3.5 border border-border">
                    <span class="text-[11px] font-medium text-ink-secondary block">Day Variance / Growth</span>
                    <h4 id="dailyVarianceBadge" class="text-lg font-bold text-ink-primary mt-0.5">0</h4>
                </div>
            </div>

            <!-- Daily MIS Spreadsheet Table -->
            <div class="bg-surface rounded-lg border border-border overflow-hidden">
                <div class="overflow-x-auto max-h-[650px] custom-scrollbar">
                    <table id="dailyMisTable" class="w-full text-left text-[13px] border-collapse">
                        <thead id="dailyTableHead" class="sticky top-0 z-30"></thead>
                        <tbody id="dailyTableBody"></tbody>
                        <tfoot id="dailyTableFoot" class="sticky bottom-0 z-30"></tfoot>
                    </table>
                </div>
            </div>
        </div>
"""

# Insert daily_mis_tab_html after sheetTab
if '<div id="dailyTab"' not in html:
    html = html.replace('<!-- TAB 2: INSIGHTS & TIMELINE -->', daily_mis_tab_html + '\n        <!-- TAB 2: INSIGHTS & TIMELINE -->')

# 3. Add Daily MIS JavaScript Logic & Excel Exporter
daily_mis_js = """
        // ==========================================
        // DAILY MIS & DATE-WISE COMPARISON ENGINE
        // ==========================================
        let selectedDailyDate = "2026-10-07"; // Format: YYYY-MM-DD
        let dailyIssuanceStore = {}; // key: "YYYY-MM-DD" -> { partner_id: { bank_id: count } }

        function initDailyMIS() {
            const todayStr = new Date().toISOString().split("T")[0];
            // Default to today or Oct 7, 2026
            selectedDailyDate = "2026-10-07";
            const dateInput = document.getElementById("dailyMisDatePicker");
            if (dateInput) dateInput.value = selectedDailyDate;
            loadDailyDataFromSupabase();
        }

        function getSameDatePreviousMonth(dateStr) {
            // e.g. "2026-10-07" -> "2026-09-07", "2027-01-05" -> "2026-12-05"
            const parts = dateStr.split("-");
            if (parts.length === 3) {
                let year = parseInt(parts[0], 10);
                let month = parseInt(parts[1], 10);
                const day = parts[2];
                if (month === 1) {
                    year -= 1;
                    month = 12;
                } else {
                    month -= 1;
                }
                return `${year}-${String(month).padStart(2, '0')}-${day}`;
            }
            return dateStr;
        }

        function handleDailyDateChange(dateVal) {
            if (!dateVal) return;
            selectedDailyDate = dateVal;
            updateDailyLabels();
            loadDailyDataFromSupabase();
        }

        function stepDailyDate(offsetDays) {
            const curr = new Date(selectedDailyDate);
            curr.setDate(curr.getDate() + offsetDays);
            selectedDailyDate = curr.toISOString().split("T")[0];
            const dateInput = document.getElementById("dailyMisDatePicker");
            if (dateInput) dateInput.value = selectedDailyDate;
            updateDailyLabels();
            loadDailyDataFromSupabase();
        }

        function setDailyDateToday() {
            selectedDailyDate = new Date().toISOString().split("T")[0];
            const dateInput = document.getElementById("dailyMisDatePicker");
            if (dateInput) dateInput.value = selectedDailyDate;
            updateDailyLabels();
            loadDailyDataFromSupabase();
        }

        function updateDailyLabels() {
            const prevDateStr = getSameDatePreviousMonth(selectedDailyDate);
            const labelEl = document.getElementById("dailyComparisonLabel");
            if (labelEl) {
                labelEl.innerText = `Comparing ${formatDateDisplay(selectedDailyDate)} vs ${formatDateDisplay(prevDateStr)} (Same date last month)`;
            }
        }

        function formatDateDisplay(dStr) {
            const parts = dStr.split("-");
            if (parts.length === 3) {
                const months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];
                const mIdx = parseInt(parts[1], 10) - 1;
                return `${parts[2]}-${months[mIdx] || parts[1]}-${parts[0]}`;
            }
            return dStr;
        }

        async function loadDailyDataFromSupabase() {
            const prevDateStr = getSameDatePreviousMonth(selectedDailyDate);
            updateDailyLabels();

            if (supabaseClient) {
                try {
                    const { data: rows, error } = await supabaseClient
                        .from('daily_issuances')
                        .select('*')
                        .in('issue_date', [selectedDailyDate, prevDateStr]);

                    if (!error && rows) {
                        dailyIssuanceStore[selectedDailyDate] = {};
                        dailyIssuanceStore[prevDateStr] = {};

                        rows.forEach(r => {
                            if (!dailyIssuanceStore[r.issue_date]) dailyIssuanceStore[r.issue_date] = {};
                            if (!dailyIssuanceStore[r.issue_date][r.partner_id]) dailyIssuanceStore[r.issue_date][r.partner_id] = {};
                            dailyIssuanceStore[r.issue_date][r.partner_id][r.bank_id] = r.card_count || 0;
                        });
                    }
                } catch (e) {
                    console.error("Daily fetch error:", e);
                }
            }

            renderDailyMISTable();
        }

        function renderDailyMISTable() {
            const tableHead = document.getElementById("dailyTableHead");
            const tableBody = document.getElementById("dailyTableBody");
            const tableFoot = document.getElementById("dailyTableFoot");

            if (!tableHead || !tableBody || !tableFoot) return;

            const prevDateStr = getSameDatePreviousMonth(selectedDailyDate);
            const banks = dbData.banks || [];
            const managersToShow = activeRole === "ADMIN" ? dbData.managers : dbData.managers.filter(m => m.manager_name === activeRole);

            const currDateData = dailyIssuanceStore[selectedDailyDate] || {};
            const prevDateData = dailyIssuanceStore[prevDateStr] || {};

            // 1. Header
            let headHTML = `
                <tr class="bg-navy text-white">
                    <th rowspan="2" class="py-2.5 px-3.5 table-th border-r border-navy-700 sticky-col-left bg-navy min-w-[260px]">Partners / Managers</th>
                    <th colspan="2" class="py-1.5 px-2.5 table-th text-center border-r border-navy-700 bg-navy-800">Day Total</th>
            `;
            banks.forEach(b => {
                headHTML += `<th colspan="2" class="py-1.5 px-2 table-th text-center border-r border-navy-700 bg-navy">${b.name}</th>`;
            });
            headHTML += `</tr><tr class="bg-navy-800 text-slate-300 text-[10px] font-semibold">
                <th class="py-1 px-2 text-right border-r border-navy-700" title="Previous Month Same Date (${formatDateDisplay(prevDateStr)})">LM (${prevDateStr.split('-')[1]}/${prevDateStr.split('-')[2]})</th>
                <th class="py-1 px-2 text-right border-r border-navy-700 text-white" title="Today (${formatDateDisplay(selectedDailyDate)})">Today (${selectedDailyDate.split('-')[1]}/${selectedDailyDate.split('-')[2]})</th>
            `;
            banks.forEach(b => {
                headHTML += `
                    <th class="py-1 px-2 text-right border-r border-navy-700 text-slate-300">LM</th>
                    <th class="py-1 px-2 text-right border-r border-navy-700 text-white">Today</th>
                `;
            });
            headHTML += `</tr>`;
            tableHead.innerHTML = headHTML;

            // 2. Body
            let bodyHTML = "";
            let grandTodayTotal = 0;
            let grandPrevDateTotal = 0;
            let grandBankTotals = {};
            banks.forEach(b => grandBankTotals[b.id] = { prev: 0, today: 0 });

            managersToShow.forEach(mgr => {
                const mgrName = mgr.manager_name;
                const formattedMgrName = formatSentenceCase(mgrName);
                const partners = mgr.partners || [];
                const isCollapsed = !!collapsedManagers[mgrName];

                let mgrToday = 0;
                let mgrPrev = 0;
                let mgrBankTotals = {};
                banks.forEach(b => mgrBankTotals[b.id] = { prev: 0, today: 0 });

                partners.forEach(p => {
                    banks.forEach(b => {
                        const todayVal = currDateData[p.id]?.[b.id] || 0;
                        const prevVal = prevDateData[p.id]?.[b.id] || 0;
                        mgrToday += todayVal;
                        mgrPrev += prevVal;
                        mgrBankTotals[b.id].today += todayVal;
                        mgrBankTotals[b.id].prev += prevVal;
                    });
                });

                grandTodayTotal += mgrToday;
                grandPrevDateTotal += mgrPrev;
                banks.forEach(b => {
                    grandBankTotals[b.id].today += mgrBankTotals[b.id].today;
                    grandBankTotals[b.id].prev += mgrBankTotals[b.id].prev;
                });

                // Manager Row (#F1F5F9)
                bodyHTML += `
                    <tr class="manager-row-header transition" data-manager="${mgrName}">
                        <td class="py-2 px-3 sticky-col-left bg-slate-100 border-r border-border text-ink-primary flex items-center justify-between cursor-pointer" onclick="toggleManager('${mgrName}')">
                            <div class="flex items-center gap-1.5">
                                <i class="fa-solid ${isCollapsed ? 'fa-chevron-right' : 'fa-chevron-down'} text-ink-secondary text-[10px] w-3"></i>
                                <span class="font-semibold text-ink-primary">${formattedMgrName}</span>
                                <span class="text-[11px] text-ink-secondary font-normal ml-1">(${partners.length})</span>
                            </div>
                        </td>
                        <td class="py-1.5 px-2 text-right font-semibold border-r border-border bg-slate-100 text-ink-secondary">${mgrPrev ? mgrPrev.toLocaleString() : '<span class="text-slate-300">-</span>'}</td>
                        <td class="py-1.5 px-2 text-right font-bold border-r border-border bg-slate-100 text-ink-primary">${mgrToday ? mgrToday.toLocaleString() : '<span class="text-slate-300">-</span>'}</td>
                `;

                banks.forEach(b => {
                    bodyHTML += `
                        <td class="py-1.5 px-2 text-right font-semibold border-r border-border/80 text-ink-secondary">${mgrBankTotals[b.id].prev ? mgrBankTotals[b.id].prev.toLocaleString() : '<span class="text-slate-300">-</span>'}</td>
                        <td class="py-1.5 px-2 text-right font-bold border-r border-border/80 text-ink-primary">${mgrBankTotals[b.id].today ? mgrBankTotals[b.id].today.toLocaleString() : '<span class="text-slate-300">-</span>'}</td>
                    `;
                });
                bodyHTML += `</tr>`;

                // Partner Rows
                if (!isCollapsed) {
                    partners.forEach(p => {
                        let pTodayTotal = 0;
                        let pPrevTotal = 0;
                        banks.forEach(b => {
                            pTodayTotal += currDateData[p.id]?.[b.id] || 0;
                            pPrevTotal += prevDateData[p.id]?.[b.id] || 0;
                        });

                        const canEdit = currentUser?.role === 'ADMIN' || currentUser?.name === mgrName;

                        bodyHTML += `
                            <tr class="hover:bg-slate-50 border-b border-border transition group" data-manager="${mgrName}" data-partner="${p.name}">
                                <td class="py-1.5 px-3 pl-7 sticky-col-left bg-surface group-hover:bg-slate-50 border-r border-border font-normal text-ink-primary truncate">${p.name}</td>
                                <td class="py-1.5 px-2 text-right border-r border-border text-ink-secondary">${pPrevTotal ? pPrevTotal.toLocaleString() : '<span class="text-slate-300">-</span>'}</td>
                                <td class="py-1.5 px-2 text-right font-semibold border-r border-border text-ink-primary">${pTodayTotal ? pTodayTotal.toLocaleString() : '<span class="text-slate-300">-</span>'}</td>
                        `;

                        banks.forEach(b => {
                            const prevVal = prevDateData[p.id]?.[b.id] || 0;
                            const todayVal = currDateData[p.id]?.[b.id] || 0;

                            bodyHTML += `
                                <td class="py-1 px-1 text-right border-r border-border text-ink-secondary text-xs">
                                    ${prevVal ? prevVal.toLocaleString() : '<span class="text-slate-300">-</span>'}
                                </td>
                                <td class="py-1 px-1 text-right border-r border-border text-xs">
                                    <input type="number" min="0" value="${todayVal || ''}" placeholder="-" ${!canEdit ? 'disabled' : ''}
                                        onchange="updateDailyMISCell('${p.id}', '${b.id}', this.value)"
                                        class="editable-cell-input w-12 text-right px-1 py-0.5 rounded font-medium text-ink-primary text-xs ${!canEdit ? 'cursor-not-allowed text-ink-muted' : ''}">
                                </td>
                            `;
                        });
                        bodyHTML += `</tr>`;
                    });
                }
            });

            tableBody.innerHTML = bodyHTML;

            // 3. Footer
            let footHTML = `
                <tr class="bg-navy text-white font-semibold text-xs border-t border-navy-700">
                    <td class="py-2.5 px-3 sticky-col-left bg-navy border-r border-navy-700 uppercase tracking-wide">Day Total Rollup</td>
                    <td class="py-2 px-2 text-right border-r border-navy-700 text-slate-300 font-bold">${grandPrevDateTotal.toLocaleString()}</td>
                    <td class="py-2 px-2 text-right border-r border-navy-700 font-bold">${grandTodayTotal.toLocaleString()}</td>
            `;
            banks.forEach(b => {
                footHTML += `
                    <td class="py-2 px-2 text-right border-r border-navy-700 text-slate-300">${grandBankTotals[b.id].prev ? grandBankTotals[b.id].prev.toLocaleString() : '-'}</td>
                    <td class="py-2 px-2 text-right border-r border-navy-700 font-semibold">${grandBankTotals[b.id].today ? grandBankTotals[b.id].today.toLocaleString() : '-'}</td>
                `;
            });
            footHTML += `</tr>`;
            tableFoot.innerHTML = footHTML;

            // 4. Update Daily KPI Strip
            document.getElementById("dailyTodayTotal").innerText = grandTodayTotal.toLocaleString() + " cards";
            document.getElementById("dailyPrevDateTotal").innerText = grandPrevDateTotal.toLocaleString() + " cards";

            const diff = grandTodayTotal - grandPrevDateTotal;
            const varBadge = document.getElementById("dailyVarianceBadge");
            if (diff >= 0) {
                varBadge.innerText = `+${diff} cards (+${grandPrevDateTotal > 0 ? ((diff / grandPrevDateTotal) * 100).toFixed(1) : 100}%)`;
                varBadge.className = "text-lg font-bold text-emerald-700 mt-0.5";
            } else {
                varBadge.innerText = `${diff} cards (${grandPrevDateTotal > 0 ? ((diff / grandPrevDateTotal) * 100).toFixed(1) : 0}%)`;
                varBadge.className = "text-lg font-bold text-red-600 mt-0.5";
            }
        }

        async function updateDailyMISCell(partnerId, bankId, value) {
            const count = parseInt(value, 10) || 0;

            // 1. Update local daily store
            if (!dailyIssuanceStore[selectedDailyDate]) dailyIssuanceStore[selectedDailyDate] = {};
            if (!dailyIssuanceStore[selectedDailyDate][partnerId]) dailyIssuanceStore[selectedDailyDate][partnerId] = {};
            dailyIssuanceStore[selectedDailyDate][partnerId][bankId] = count;

            // 2. Update Master Sheet totals for this partner and bank
            const monthCode = selectedDailyDate.substring(0, 7); // e.g. '2026-10'
            dbData.managers.forEach(m => {
                const p = m.partners.find(part => part.id === partnerId);
                if (p) {
                    if (!p.banks[bankId]) p.banks[bankId] = { lm: 0, cm: 0 };
                    // If editing in active month, update CM
                    if (monthCode === currentActiveMonth) {
                        p.banks[bankId].cm = (p.banks[bankId].cm || 0) + count;
                    }
                }
            });

            renderDailyMISTable();
            recalculateAll();
            renderStats();

            // 3. Persist to Supabase daily_issuances table
            if (supabaseClient && partnerId) {
                try {
                    const { error } = await supabaseClient
                        .from('daily_issuances')
                        .upsert({
                            partner_id: partnerId,
                            bank_id: bankId,
                            issue_date: selectedDailyDate,
                            card_count: count
                        }, { onConflict: 'partner_id,bank_id,issue_date' });

                    if (error) throw error;
                    showToast(`Saved ${count} cards for ${formatDateDisplay(selectedDailyDate)}`);
                } catch (e) {
                    console.error("Supabase daily write error:", e);
                    showToast("Daily write error: " + e.message, "error");
                }
            }
        }

        // ==========================================
        // EXPORT DAILY MIS TO EXCEL (.xlsx)
        // ==========================================
        function exportDailyMisExcelClientSide() {
            try {
                const prevDateStr = getSameDatePreviousMonth(selectedDailyDate);
                const banks = dbData.banks || [];
                const managersToShow = activeRole === "ADMIN" ? dbData.managers : dbData.managers.filter(m => m.manager_name === activeRole);

                const currDateData = dailyIssuanceStore[selectedDailyDate] || {};
                const prevDateData = dailyIssuanceStore[prevDateStr] || {};

                const masterRows = [];
                masterRows.push([`Daily Credit Card Issuance MIS Report`]);
                masterRows.push([`Date Comparison: ${formatDateDisplay(selectedDailyDate)} (Today) vs ${formatDateDisplay(prevDateStr)} (Same Date Last Month)`]);
                masterRows.push([]);

                // Header 1
                const header1 = ["PARTNERS / MANAGERS", "DAY TOTAL", ""];
                banks.forEach(b => {
                    header1.push(b.name);
                    header1.push("");
                });
                masterRows.push(header1);

                // Header 2
                const header2 = ["", `LM (${formatDateDisplay(prevDateStr)})`, `Today (${formatDateDisplay(selectedDailyDate)})`];
                banks.forEach(() => {
                    header2.push("LM");
                    header2.push("Today");
                });
                masterRows.push(header2);

                let grandTodayTotal = 0;
                let grandPrevDateTotal = 0;
                let grandBankTotals = {};
                banks.forEach(b => grandBankTotals[b.id] = { prev: 0, today: 0 });

                managersToShow.forEach(mgr => {
                    let mgrToday = 0, mgrPrev = 0;
                    let mgrBankTotals = {};
                    banks.forEach(b => mgrBankTotals[b.id] = { prev: 0, today: 0 });

                    mgr.partners.forEach(p => {
                        banks.forEach(b => {
                            const todayVal = currDateData[p.id]?.[b.id] || 0;
                            const prevVal = prevDateData[p.id]?.[b.id] || 0;
                            mgrToday += todayVal;
                            mgrPrev += prevVal;
                            mgrBankTotals[b.id].today += todayVal;
                            mgrBankTotals[b.id].prev += prevVal;
                        });
                    });

                    grandTodayTotal += mgrToday;
                    grandPrevDateTotal += mgrPrev;
                    banks.forEach(b => {
                        grandBankTotals[b.id].today += mgrBankTotals[b.id].today;
                        grandBankTotals[b.id].prev += mgrBankTotals[b.id].prev;
                    });

                    // Manager Row
                    const mgrRow = [formatSentenceCase(mgr.manager_name), mgrPrev, mgrToday];
                    banks.forEach(b => {
                        mgrRow.push(mgrBankTotals[b.id].prev);
                        mgrRow.push(mgrBankTotals[b.id].today);
                    });
                    masterRows.push(mgrRow);

                    // Partner Rows
                    mgr.partners.forEach(p => {
                        let pTodayTotal = 0, pPrevTotal = 0;
                        banks.forEach(b => {
                            pTodayTotal += currDateData[p.id]?.[b.id] || 0;
                            pPrevTotal += prevDateData[p.id]?.[b.id] || 0;
                        });

                        const pRow = [`    ${p.name}`, pPrevTotal, pTodayTotal];
                        banks.forEach(b => {
                            pRow.push(prevDateData[p.id]?.[b.id] || 0);
                            pRow.push(currDateData[p.id]?.[b.id] || 0);
                        });
                        masterRows.push(pRow);
                    });
                });

                // Grand Total
                const gtRow = ["TOTAL DAY ROLLUP", grandPrevDateTotal, grandTodayTotal];
                banks.forEach(b => {
                    gtRow.push(grandBankTotals[b.id].prev);
                    gtRow.push(grandBankTotals[b.id].today);
                });
                masterRows.push(gtRow);

                const wb = XLSX.utils.book_new();
                const ws = XLSX.utils.aoa_to_sheet(masterRows);

                const colWidths = [{ wch: 34 }, { wch: 14 }, { wch: 14 }];
                banks.forEach(() => { colWidths.push({ wch: 8 }); colWidths.push({ wch: 8 }); });
                ws['!cols'] = colWidths;

                XLSX.utils.book_append_sheet(wb, ws, "Daily MIS Report");
                const filename = `Daily_MIS_${selectedDailyDate}_vs_${prevDateStr}.xlsx`;
                XLSX.writeFile(wb, filename);
                showToast(`Downloaded ${filename}`);
            } catch (err) {
                console.error("Daily MIS export error:", err);
            }
        }
"""

# Insert daily_mis_js right before switchTab
if "function initDailyMIS" not in html:
    html = html.replace("function switchTab(tabId) {", daily_mis_js + "\n\n        function switchTab(tabId) {")

# Call initDailyMIS on DOMContentLoaded
html = html.replace("checkAuthSession();", "checkAuthSession();\n            initDailyMIS();")

# Enhance switchTab to load daily MIS when dailyTab is opened
old_switch_tab = """            if (tabId === "insightsTab") renderInsights();"""
new_switch_tab = """            if (tabId === "insightsTab") renderInsights();
            if (tabId === "dailyTab") renderDailyMISTable();"""
html = html.replace(old_switch_tab, new_switch_tab)

with open("index.html", "w", encoding="utf-8") as f:
    f.write(html)

with open("templates/index.html", "w", encoding="utf-8") as f:
    f.write(html)

print("Implemented Daily MIS Entry, Date-to-Date Comparison (e.g. 7/10 vs 7/09), Master Rollup Sync, and Daily Excel Export!")
