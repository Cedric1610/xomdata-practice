-- Xom Data · Customer spending per order
-- Problem: https://xomdata.com/practice/medium-join-001
-- Solved: 2026-09-07

WITH base_data AS
(
SELECT full_name, COUNT(o.id) AS order_count, SUM(total_amount) AS total_spending, COALESCE(ROUND(SUM(total_amount)/COUNT(o.id),0),0) AS avg_order_value
FROM orders AS o
JOIN customers AS c
    ON o.customer_id = c.id
GROUP BY full_name
)
SELECT *,
ROW_NUMBER() OVER(ORDER BY total_spending DESC, full_name ASC) AS spending_rank
FROM base_data
ORDER BY spending_rank ASC
