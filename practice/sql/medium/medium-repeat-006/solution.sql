-- Xom Data · Khách chuyên cần đủ bốn mùa
-- Problem: https://xomdata.com/practice/medium-repeat-006
-- Solved: 2026-09-02

WITH base_data AS
(
SELECT customer_id, 'Q' || ((CAST(strftime('%m', order_date) AS INT) + 2) / 3) AS quarter, COUNT(order_id) AS orders_count
FROM orders
WHERE order_date >= '2024-01-01' AND order_date <= '2024-12-31'
GROUP BY customer_id, quarter
)
SELECT customer_id, SUM(orders_count) AS orders_2024
FROM base_data
GROUP BY customer_id
HAVING COUNT(quarter) = 4
