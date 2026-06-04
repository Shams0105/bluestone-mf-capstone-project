-- Bluestock MF Capstone | 10 Analytical Queries
--- These queries are designed to extract insights from the mutual fund dataset, covering various aspects such as fund performance, investor behavior, and market trends. Each query is crafted to answer specific business questions that can help stakeholders make informed decisions.

-- Q1: Top 5 funds by AUM
SELECT scheme_name, fund_house, aum_crore
FROM fact_performance
JOIN dim_fund USING (amfi_code)
ORDER BY aum_crore DESC
LIMIT 5;

-- Q2: Average NAV per month for each fund
SELECT amfi_code,
       strftime('%Y-%m', date) AS month,
       ROUND(AVG(nav), 4)      AS avg_nav
FROM fact_nav
GROUP BY amfi_code, month
ORDER BY amfi_code, month;

-- Q3: SIP inflow YoY growth
SELECT month, sip_inflow_crore, yoy_growth_pct
FROM fact_sip_industry
ORDER BY month;

-- Q4: Total transaction amount by state
SELECT state,
       ROUND(SUM(amount_inr) / 1e7, 2) AS total_amount_crore
FROM fact_transactions
GROUP BY state
ORDER BY total_amount_crore DESC;

-- Q5: Funds with expense ratio less than 1%
SELECT scheme_name, fund_house, expense_ratio_pct
FROM dim_fund
WHERE expense_ratio_pct < 1.0
ORDER BY expense_ratio_pct ASC;

-- Q6: Best performing funds by 3yr CAGR
SELECT d.scheme_name, d.fund_house, p.return_3yr_pct
FROM fact_performance p
JOIN dim_fund d USING (amfi_code)
ORDER BY p.return_3yr_pct DESC
LIMIT 10;

-- Q7: Average SIP amount by age group
SELECT age_group,
       ROUND(AVG(amount_inr), 2) AS avg_sip_amount
FROM fact_transactions
WHERE transaction_type = 'SIP'
GROUP BY age_group
ORDER BY avg_sip_amount DESC;

-- Q8: Top 5 sectors by total portfolio weight
SELECT sector,
       ROUND(SUM(weight_pct), 2) AS total_weight
FROM fact_portfolio
GROUP BY sector
ORDER BY total_weight DESC
LIMIT 5;

-- Q9: Funds with Sharpe ratio greater than 1
SELECT d.scheme_name, d.fund_house, p.sharpe_ratio
FROM fact_performance p
JOIN dim_fund d USING (amfi_code)
WHERE p.sharpe_ratio > 1
ORDER BY p.sharpe_ratio DESC;

-- Q10: SIP vs Lumpsum vs Redemption transaction count
SELECT transaction_type,
       COUNT(*)                        AS total_transactions,
       ROUND(SUM(amount_inr)/1e7, 2)  AS total_amount_crore
FROM fact_transactions
GROUP BY transaction_type;