-- Xom Data · Khách chạm mốc ba đơn một năm
-- Problem: https://xomdata.com/practice/medium-frequency-002
-- Solved: 2026-08-23

SELECT customer_id, COUNT(order_id) AS order_count
FROM orders
WHERE order_date >=  '2024-01-01' AND order_date <= '2024-12-31'
GROUP BY customer_id
HAVING COUNT(order_id) >= 3
