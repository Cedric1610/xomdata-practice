-- Xom Data · Ai nhập hội đúng mùa khuyến mãi
-- Problem: https://xomdata.com/practice/medium-cohort-007
-- Solved: 2026-09-04

SELECT customer_id, MIN(order_date) AS first_order_date, SUM(
    CASE
        WHEN strftime('%Y-%m',order_date) = '2024-03' THEN 1
        ELSE 0
    END
) AS campaign_orders
FROM orders
GROUP BY customer_id
HAVING strftime('%Y-%m',MIN(order_date)) = '2024-03'
