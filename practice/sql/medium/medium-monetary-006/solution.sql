-- Xom Data · Sức chi mỗi tháng hoạt động
-- Problem: https://xomdata.com/practice/medium-monetary-006
-- Solved: 2026-09-04

WITH base_data AS
(
SELECT customer_id, 
    SUM(amount) AS total_spent,
    COUNT(DISTINCT
    strftime('%Y-%m',order_date)) AS active_months
FROM orders
GROUP BY customer_id
)
SELECT *,
ROUND((total_spent * 1.0/active_months),2) AS spend_per_month
FROM base_data
ORDER BY spend_per_month DESC, customer_id ASC
