-- Xom Data · Bức ảnh tệp khách tại một thời điểm
-- Problem: https://xomdata.com/practice/medium-churn-006
-- Solved: 2026-09-05

WITH base_data AS
(
SELECT customer_id, MIN(order_date) AS newest_order,
julianday('2024-06-30') - julianday(MAX(order_date)) AS churn_day,
    CASE
        WHEN strftime('%Y-%m',MIN(order_date)) = '2024-06' THEN 'new'
        WHEN (julianday('2024-06-30') - julianday(MAX(order_date))) > 90 THEN 'churned'
        ELSE 'active'
    END AS segment
FROM orders
GROUP BY customer_id
)
SELECT segment, COUNT(customer_id) AS customer_count
FROM base_data
GROUP BY segment
