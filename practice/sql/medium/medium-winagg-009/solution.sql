-- Xom Data · Each category's slice of revenue
-- Problem: https://xomdata.com/practice/medium-winagg-009
-- Solved: 2026-09-04

SELECT category, SUM(amount) AS total_revenue,
ROUND(SUM(amount) * 100.00 / SUM(SUM(amount)) OVER(),2) AS pct_share
FROM sales
GROUP BY category
ORDER BY total_revenue DESC, category ASC
