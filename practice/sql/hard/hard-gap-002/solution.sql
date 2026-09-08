-- Xom Data · Quãng im lặng dài nhất của mỗi khách
-- Problem: https://xomdata.com/practice/hard-gap-002
-- Solved: 2026-09-08

WITH base_data AS
(
SELECT customer_id,
    COALESCE(LAG(order_date,1) OVER(PARTITION BY customer_id ORDER BY order_date ASC),order_date) AS gap_start,
    order_date AS gap_end 
FROM orders
), agg_data AS
(
SELECT *, julianday(gap_end) - julianday(gap_start) AS distance_day
FROM base_data
)
SELECT customer_id, gap_start, gap_end, MAX(distance_day) AS gap_days
FROM agg_data
GROUP BY customer_id
HAVING COUNT(customer_id) >= 2
ORDER BY gap_days DESC, customer_id ASC
