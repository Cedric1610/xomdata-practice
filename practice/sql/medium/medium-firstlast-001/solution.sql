-- Xom Data · Lần đầu và lần gần nhất của mỗi khách
-- Problem: https://xomdata.com/practice/medium-firstlast-001
-- Solved: 2026-08-31

SELECT customer_id, MIN(order_date) AS first_order_date,
MAX(order_date)  AS last_order_date
FROM orders
GROUP BY customer_id
ORDER BY customer_id ASC
