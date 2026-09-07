-- Xom Data · The customer's total next to every order
-- Problem: https://xomdata.com/practice/medium-winjoin-002
-- Solved: 2026-09-07

SELECT customer_name, order_date, amount,
    SUM(amount) OVER(PARTITION BY customer_name) AS customer_total
FROM orders AS o
JOIN customers AS c
    ON o.customer_id = c.id
ORDER BY customer_name ASC, order_date ASC
