-- Xom Data · Kênh nào đang giữ được hơi ấm
-- Problem: https://xomdata.com/practice/medium-recency-005
-- Solved: 2026-09-06

WITH base_data AS
(
    SELECT 
        c.channel, 
        c.customer_id, 
        MAX(o.order_date) AS last_order_date
    FROM customers AS c
    JOIN orders AS o
        ON c.customer_id = o.customer_id
    GROUP BY c.channel, c.customer_id
)
SELECT 
    channel, 
    COUNT(customer_id) AS customers,
    ROUND(AVG(julianday('2024-06-30') - julianday(last_order_date)), 2) AS avg_days_silent
FROM base_data
GROUP BY 
    channel
ORDER BY avg_days_silent ASC, channel ASC;
