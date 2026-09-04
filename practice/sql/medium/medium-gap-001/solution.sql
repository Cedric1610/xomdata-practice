-- Xom Data · Khoảng lặng giữa hai lần mua liền kề
-- Problem: https://xomdata.com/practice/medium-gap-001
-- Solved: 2026-09-04

WITH base_data AS
(
SELECT customer_id, order_date, 
julianday(order_date) - julianday(LAG(order_date,1) OVER(PARTITION BY customer_id ORDER BY order_date ASC)) AS days_since_prev
FROM orders
)
SELECT *
FROM base_data
WHERE days_since_prev IS NOT NULL
