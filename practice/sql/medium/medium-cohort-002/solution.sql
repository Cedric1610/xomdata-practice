-- Xom Data · Opening order or returning order
-- Problem: https://xomdata.com/practice/medium-cohort-002
-- Solved: 2026-08-10

WITH cte_table AS
(
SELECT customer_name, order_date, amount,
MIN(order_date) OVER(PARTITION BY customer_name) AS cohort
FROM orders
)
SELECT customer_name, order_date, amount,
CASE
    WHEN order_date = cohort THEN 'New'
    ELSE 'Returning'
END AS order_type
FROM cte_table
ORDER BY customer_name ASC, order_date ASC
