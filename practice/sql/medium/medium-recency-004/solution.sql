-- Xom Data · Ba vòng tròn độ tươi của tệp khách
-- Problem: https://xomdata.com/practice/medium-recency-004
-- Solved: 2026-09-09

WITH base_data AS
(
SELECT customer_id, julianday('2024-06-30') - julianday(MAX(order_date)) AS gap_day,
    CASE
        WHEN julianday('2024-06-30') - julianday(MAX(order_date)) BETWEEN 0 AND 30 THEN 'hot'
        WHEN julianday('2024-06-30') - julianday(MAX(order_date)) >= 91 THEN 'cold'
        ELSE 'warm'
    END AS freshness_bucket
FROM orders
GROUP BY customer_id
)
SELECT freshness_bucket, COUNT(*) AS customer_count
FROM base_data
GROUP BY freshness_bucket
ORDER BY 
    CASE freshness_bucket
        WHEN 'hot' THEN 1
        WHEN 'warm' THEN 2
        WHEN 'cold' THEN 3
        ELSE '' 
    END ASC
