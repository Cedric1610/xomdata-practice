-- Xom Data · Khách phủ sóng nhiều tháng nhất
-- Problem: https://xomdata.com/practice/medium-frequency-005
-- Solved: 2026-09-14

WITH base_data AS
(
SELECT customer_id, strftime('%Y-%m',order_date) AS month_, COUNT(order_id) AS orders_per_month
FROM orders
GROUP BY customer_id, month_
)
SELECT customer_id, COUNT(month_) AS active_months, SUM(orders_per_month) AS total_orders
FROM base_data
GROUP BY customer_id
ORDER BY active_months DESC, customer_id ASC
