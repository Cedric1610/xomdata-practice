-- Xom Data · Tháng chào sân của từng khách
-- Problem: https://xomdata.com/practice/medium-cohort-003
-- Solved: 2026-08-26

SELECT customer_id,
strftime('%Y-%m',MIN(order_date)) AS cohort_month
FROM orders
GROUP BY customer_id
ORDER BY cohort_month ASC, customer_id ASC
