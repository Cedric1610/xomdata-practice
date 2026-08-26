-- Xom Data · Bao lâu rồi khách chưa quay lại
-- Problem: https://xomdata.com/practice/medium-recency-001
-- Solved: 2026-08-26

WITH base_data AS
(
SELECT customer_id,
MAX(order_date) AS last_order_date
FROM orders
GROUP BY customer_id
)
SELECT *,
julianday('2024-06-30') - julianday(last_order_date) AS days_since
FROM base_data
ORDER BY days_since ASC, customer_id ASC
