-- Xom Data · Mỗi thế hệ khách đông cỡ nào
-- Problem: https://xomdata.com/practice/medium-cohort-004
-- Solved: 2026-09-04

WITH base_data AS
(
SELECT customer_id, strftime('%Y-%m',MIN(order_date)) AS cohort_month
FROM orders
GROUP BY customer_id
)
SELECT cohort_month, COUNT(customer_id) AS cohort_size
FROM base_data
GROUP BY cohort_month
ORDER BY cohort_month ASC
