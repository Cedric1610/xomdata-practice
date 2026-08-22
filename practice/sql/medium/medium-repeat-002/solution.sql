-- Xom Data · Cửa hàng giữ được bao nhiêu phần khách
-- Problem: https://xomdata.com/practice/medium-repeat-002
-- Solved: 2026-08-22

WITH cus_order AS (
    SELECT 
        customer_id, 
        COUNT(customer_id) AS total_orders
    FROM orders
    GROUP BY customer_id
)
SELECT 
    ROUND(
        COUNT(CASE WHEN total_orders >= 2 THEN 1 END) * 100.0 / COUNT(customer_id), 
        2
    ) AS repeat_rate_pct
FROM cus_order;
