-- Xom Data · Customers silent for 90 days
-- Problem: https://xomdata.com/practice/hard-anti-001
-- Solved: 2026-08-23

WITH base_data AS (
    SELECT
        user_id,
        MAX(order_date) AS last_order_date,
        MAX(MAX(order_date)) OVER () AS newest_day
    FROM orders
    GROUP BY user_id
)
SELECT
    user_id,
    last_order_date,
    CAST(
        julianday(newest_day) - julianday(last_order_date)
        AS INTEGER
    ) AS days_since_last
FROM base_data
WHERE days_since_last >= 90
ORDER BY days_since_last DESC, user_id ASC;
