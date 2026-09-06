-- Xom Data · Vùng cảnh báo vàng trước khi mất khách
-- Problem: https://xomdata.com/practice/medium-churn-005
-- Solved: 2026-09-06

SELECT customer_id, MAX(order_date) AS last_order_date, (julianday('2024-06-30') - julianday(MAX(order_date))) AS days_silent
FROM orders
GROUP BY customer_id
HAVING days_silent BETWEEN 60 AND 89
ORDER BY days_silent DESC, customer_id ASC
