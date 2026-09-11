-- Xom Data · Chia khách thành năm hạng chi tiêu
-- Problem: https://xomdata.com/practice/hard-monetary-001
-- Solved: 2026-09-11

WITH base_data AS
(
SELECT customer_id, SUM(amount) AS total_spent
FROM orders
GROUP BY customer_id
)
SELECT *,
NTILE(5) OVER(ORDER BY total_spent DESC, customer_id ASC) as spend_rank
FROM base_data
ORDER BY spend_rank ASC, customer_id ASC
