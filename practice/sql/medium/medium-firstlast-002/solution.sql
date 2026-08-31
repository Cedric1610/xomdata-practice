-- Xom Data · Gương mặt ghé gần nhất của từng kênh
-- Problem: https://xomdata.com/practice/medium-firstlast-002
-- Solved: 2026-08-31

WITH base_data AS
(
SELECT channel, c.customer_id, max(order_date) AS last_order_date,
RANK() OVER(PARTITION BY channel ORDER BY order_date DESC, c.customer_id ASC) AS ranking
FROM customers AS c
JOIN orders AS o
    ON c.customer_id = o.customer_id
GROUP BY channel, c.customer_id
)
SELECT channel, customer_id, last_order_date
FROM base_data
WHERE ranking = 1
ORDER BY channel ASC
