-- Step 9 — Write the schema.sql file , This is required for GitHub

-- Bluestock MF Capstone | Schema DDL


CREATE TABLE IF NOT EXISTS dim_fund (
    amfi_code           INTEGER PRIMARY KEY,
    scheme_name         TEXT,
    fund_house          TEXT,
    category            TEXT,
    sub_category        TEXT,
    plan                TEXT,
    launch_date         DATE,
    benchmark           TEXT,
    expense_ratio_pct   REAL,
    exit_load_pct       REAL,
    fund_manager        TEXT,
    risk_category       TEXT,
    sebi_category_code  TEXT
);

CREATE TABLE IF NOT EXISTS fact_nav (
    date        DATE,
    amfi_code   INTEGER,
    nav         REAL,
    FOREIGN KEY (amfi_code) REFERENCES dim_fund(amfi_code)
);

CREATE TABLE IF NOT EXISTS fact_transactions (
    investor_id         TEXT,
    transaction_date    DATE,
    amfi_code           INTEGER,
    transaction_type    TEXT,
    amount_inr          INTEGER,
    state               TEXT,
    city                TEXT,
    city_tier           TEXT,
    age_group           TEXT,
    gender              TEXT,
    annual_income_lakh  REAL,
    payment_mode        TEXT,
    kyc_status          TEXT,
    FOREIGN KEY (amfi_code) REFERENCES dim_fund(amfi_code)
);

CREATE TABLE IF NOT EXISTS fact_performance (
    amfi_code           INTEGER,
    return_1yr_pct      REAL,
    return_3yr_pct      REAL,
    return_5yr_pct      REAL,
    benchmark_3yr_pct   REAL,
    alpha               REAL,
    beta                REAL,
    sharpe_ratio        REAL,
    sortino_ratio       REAL,
    std_dev_ann_pct     REAL,
    max_drawdown_pct    REAL,
    aum_crore           INTEGER,
    expense_ratio_pct   REAL,
    morningstar_rating  INTEGER,
    risk_grade          TEXT,
    FOREIGN KEY (amfi_code) REFERENCES dim_fund(amfi_code)
);

CREATE TABLE IF NOT EXISTS fact_aum (
    fund_house      TEXT,
    date            DATE,
    aum_crore       REAL,
    aum_lakh_crore  REAL,
    num_schemes     INTEGER
);

CREATE TABLE IF NOT EXISTS fact_sip_industry (
    month                   TEXT,
    sip_inflow_crore        REAL,
    active_sip_accounts_crore REAL,
    new_sip_accounts_lakh   REAL,
    sip_aum_lakh_crore      REAL,
    yoy_growth_pct          REAL
);

CREATE TABLE IF NOT EXISTS fact_category_inflows (
    month       TEXT,
    category    TEXT,
    net_inflow  REAL
);

CREATE TABLE IF NOT EXISTS fact_folio_count (
    date            DATE,
    equity_folios   REAL,
    debt_folios     REAL,
    hybrid_folios   REAL,
    total_folios    REAL
);

CREATE TABLE IF NOT EXISTS fact_portfolio (
    amfi_code       INTEGER,
    stock_symbol    TEXT,
    stock_name      TEXT,
    sector          TEXT,
    weight_pct      REAL,
    date            DATE,
    FOREIGN KEY (amfi_code) REFERENCES dim_fund(amfi_code)
);

CREATE TABLE IF NOT EXISTS fact_benchmark (
    date            DATE,
    index_name      TEXT,
    closing_value   REAL
);