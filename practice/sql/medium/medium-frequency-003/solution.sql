-- Xom Data · Tháng vàng của từng khách
-- Problem: https://xomdata.com/practice/medium-frequency-003
-- Solved: 2026-09-14

WITH order_count AS (
    SELECT 
        customer_id, 
        strftime('%Y-%m', order_date) AS best_month, 
        COUNT(order_id) AS orders_in_month
    FROM orders
    GROUP BY 
        customer_id, 
        strftime('%Y-%m', order_date)
),
ranking_month AS (
    SELECT 
        customer_id,
        best_month,
        orders_in_month,
        ROW_NUMBER() OVER(
            PARTITION BY customer_id 
            ORDER BY orders_in_month DESC, best_month ASC
        ) AS rank_pos
    FROM order_count
)
SELECT customer_id, best_month, orders_in_month
FROM ranking_month
WHERE rank_pos = 1
ORDER BY customer_id ASC;
