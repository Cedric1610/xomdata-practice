-- Xom Data · Miếng bánh doanh thu của từng khách
-- Problem: https://xomdata.com/practice/medium-monetary-005
-- Solved: 2026-09-02

WITH base_data AS
(
SELECT customer_id, amount, SUM(amount) OVER() AS test
FROM orders
)
SELECT customer_id, SUM(amount) AS total_spent,
ROUND(SUM(amount) * 100.0 /test,2) AS revenue_share_pct
FROM base_data
GROUP BY customer_id
ORDER BY revenue_share_pct DESC, customer_id ASC
