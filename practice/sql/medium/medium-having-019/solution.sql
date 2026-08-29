-- Xom Data · High-rated sellers with many orders
-- Problem: https://xomdata.com/practice/medium-having-019
-- Solved: 2026-08-29

WITH base_data AS
(
SELECT store_name, reputation_score, COUNT(o.seller_id) AS order_count
FROM orders AS o
LEFT JOIN sellers AS s
    ON o.seller_id = s.id
GROUP BY store_name
HAVING reputation_score >= 4.5 AND COUNT(o.seller_id) >= 3
)
SELECT *,
DENSE_RANK() OVER(ORDER BY order_count DESC) AS rank_by_orders,
SUM(order_count) OVER(ORDER BY order_count DESC, store_name ASC) AS cumulative_orders
FROM base_data
ORDER BY rank_by_orders ASC, store_name ASC
