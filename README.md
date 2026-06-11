# Bluestock Fintech — Mutual Fund Analytics Platform
### Capstone Project | Data Engineering + Analytics + Dashboard

## Project Overview
A full-stack mutual fund analytics platform built for Bluestock Fintech that ingests, 
processes, analyses and visualises data from 40 real mutual fund schemes across 
10 AMCs covering 4.5 years of NAV history (Jan 2022 – May 2026).

## Tech Stack
- **Language:** Python 3.10+
- **Data Processing:** Pandas, NumPy
- **Visualisation:** Matplotlib, Seaborn, Plotly
- **Database:** SQLite + SQLAlchemy
- **Dashboard:** Power BI Desktop
- **API:** mfapi.in (live NAV data)
- **Version Control:** Git + GitHub

## Folder Structure
```
bluestock_mf_capstone/
├── data/
│   ├── raw/           ← Original CSV datasets
│   ├── processed/     ← Cleaned CSVs + charts
│   └── db/            ← SQLite database (not pushed)
├── notebooks/
│   ├── 01_data_ingestion.ipynb
│   ├── 02_data_cleaning.ipynb
│   ├── 03_eda_analysis.ipynb
│   ├── 04_performance_analytics.ipynb
│   └── 05_advanced_analytics.ipynb
├── scripts/
│   ├── etl_pipeline.py
│   └── live_nav_fetch.py
├── sql/
│   ├── schema.sql
│   └── queries.sql
├── dashboard/
│   └── bluestock_mf_dashboard.pbix
├── reports/
│   ├── Final_Report.pdf
│   └── Dashboard.pdf
└── README.md
```

## How to Run
1. Clone the repository
2. Install dependencies: `pip install -r requirements.txt`
3. Run ETL pipeline: `python scripts/etl_pipeline.py`
4. Open notebooks in order (01 → 05)
5. Open `dashboard/bluestock_mf_dashboard.pbix` in Power BI Desktop

## Datasets
| # | Dataset | Rows | Description |
|---|---------|------|-------------|
| 01 | fund_master | 40 | Master list of 40 fund schemes |
| 02 | nav_history | 46,000 | Daily NAV Jan 2022 – May 2026 |
| 03 | aum_by_fund_house | 90 | Quarterly AUM for 10 AMCs |
| 04 | monthly_sip_inflows | 48 | Monthly SIP inflow data |
| 05 | category_inflows | 144 | Net inflows by fund category |
| 06 | industry_folio_count | 21 | Total MF folios over time |
| 07 | scheme_performance | 40 | Risk-return metrics per fund |
| 08 | investor_transactions | 32,778 | SIP/Lumpsum/Redemption data |
| 09 | portfolio_holdings | 322 | Top equity holdings per fund |
| 10 | benchmark_indices | 8,050 | Nifty 50, 100, Midcap, SmallCap |

## Key Findings
- SBI Mutual Fund leads with Rs. 12.5 lakh crore AUM (Dec 2025)
- Monthly SIP inflows hit all-time high of Rs. 31,002 crore (Dec 2025)
- HDFC Mid-Cap Opportunities Fund scored 100/100 on composite scorecard
- Mirae Asset Large Cap has best Sharpe ratio (1.07)
- 97.8% of active SIP investors show irregular payment patterns
- Small Cap funds carry highest risk (VaR -2.39% daily)

## Deliverables
- D1: ETL Pipeline (`scripts/etl_pipeline.py`)
- D2: SQLite Database (`sql/schema.sql`)
- D3: EDA Notebook (`notebooks/03_eda_analysis.ipynb`)
- D4: Performance Analytics (`notebooks/04_performance_analytics.ipynb`)
- D5: Power BI Dashboard (`dashboard/bluestock_mf_dashboard.pbix`)
- D6: Advanced Analytics (`notebooks/05_advanced_analytics.ipynb`)
- D7: Final Report (`reports/Final_Report.pdf`)

## Author
Intern — Bluestock Fintech Pvt. Ltd. | June 2026
```

 