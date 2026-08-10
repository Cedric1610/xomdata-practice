-- Xom Data · The customer's joining month on every order
-- Problem: https://xomdata.com/practice/medium-cohort-001
-- Solved: 2026-08-10

SELECT customer_name, order_date,
STRFTIME('%Y-%m',MIN(order_date) OVER(PARTITION BY customer_name)) AS cohort_month
FROM orders
ORDER BY customer_name ASC, order_date ASC
