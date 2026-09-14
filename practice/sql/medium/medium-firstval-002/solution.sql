-- Xom Data · First purchase date next to every order
-- Problem: https://xomdata.com/practice/medium-firstval-002
-- Solved: 2026-09-14

SELECT customer_name, order_date, amount,
MIN(order_date) OVER(PARTITION BY customer_name) AS first_order_date
FROM orders
ORDER BY customer_name ASC, order_date ASC
