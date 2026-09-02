-- Xom Data · Ai chuyên cần suốt cả quý
-- Problem: https://xomdata.com/practice/medium-active-004
-- Solved: 2026-09-02

WITH base_data AS
(
SELECT customer_id, strftime('%Y-%m', order_date) AS y_month, COUNT(order_id) AS order_count
FROM orders
WHERE order_date <= '2024-03-31' 
GROUP BY customer_id, y_month
)
SELECT customer_id
FROM base_data
GROUP BY customer_id
HAVING COUNT(DISTINCT y_month) >= 3
