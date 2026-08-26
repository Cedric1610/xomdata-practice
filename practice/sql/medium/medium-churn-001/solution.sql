-- Xom Data · Gắn nhãn khách còn gắn bó hay đã rời đi
-- Problem: https://xomdata.com/practice/medium-churn-001
-- Solved: 2026-08-26

WITH base_data AS
(
SELECT customer_id,
MAX(order_date) AS last_order_date
FROM orders
GROUP BY customer_id
)
SELECT *,
CASE
    WHEN julianday('2024-06-30') - julianday(last_order_date) > 90 THEN 'churned'
    ELSE 'active'
END AS status
FROM base_data
