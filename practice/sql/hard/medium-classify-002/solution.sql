-- Xom Data · Thứ bậc chi tiêu trong nội bộ mỗi kênh
-- Problem: https://xomdata.com/practice/medium-classify-002
-- Solved: 2026-08-25

WITH base_data AS
(
SELECT channel, o.customer_id, SUM(amount) AS total_spent
FROM orders AS o
LEFT JOIN customers AS c
    ON o.customer_id = c.customer_id
GROUP BY channel, o.customer_id
)
SELECT *,
DENSE_RANK() OVER(PARTITION BY channel ORDER BY total_spent DESC) AS rank_in_channel
FROM base_data
ORDER BY channel ASC, rank_in_channel ASC, customer_id ASC
