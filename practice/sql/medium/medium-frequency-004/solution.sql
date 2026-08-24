-- Xom Data · Bức tranh phân bố mức độ gắn bó
-- Problem: https://xomdata.com/practice/medium-frequency-004
-- Solved: 2026-08-24

WITH base_data AS
(
SELECT customer_id, COUNT(order_id) AS num_order,
CASE
    WHEN COUNT(order_id) = 1 THEN '1 order'
    WHEN COUNT(order_id) = 2 THEN '2 orders'
    WHEN COUNT(order_id) = 0 THEN 'never_buy'
    ELSE '3+ orders'
END AS status
FROM orders
GROUP BY customer_id
)
SELECT status AS engagement_bucket, COUNT(status) AS customer_count
FROM base_data
WHERE status != 'never_buy'
GROUP BY status
ORDER BY status ASC
