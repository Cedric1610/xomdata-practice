-- Xom Data · Quy mô và tiền tươi tháng đầu của mỗi thế hệ
-- Problem: https://xomdata.com/practice/medium-cohort-008
-- Solved: 2026-09-05

WITH base_data AS (
    SELECT 
        customer_id,
        amount,
        strftime('%Y-%m', order_date) AS order_month,
        MIN(strftime('%Y-%m', order_date)) OVER(PARTITION BY customer_id) AS cohort_month
    FROM orders
)
SELECT 
    cohort_month,
    COUNT(DISTINCT customer_id) AS cohort_size,
    SUM(amount) AS first_month_revenue
FROM base_data
WHERE order_month = cohort_month
GROUP BY cohort_month
ORDER BY cohort_month ASC;
