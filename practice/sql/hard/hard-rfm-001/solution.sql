-- Xom Data · Chấm điểm khách hàng trên ba thước đo
-- Problem: https://xomdata.com/practice/hard-rfm-001
-- Solved: 2026-09-15

WITH base_data AS
(
SELECT customer_id, 
        julianday('2024-06-30') - julianday(MAX(order_date)) AS newest_day, 
        COUNT(order_id) AS total_orders,
        SUM(amount) AS total_spent
FROM orders
GROUP BY customer_id
), marking_data AS
(
SELECT customer_id,
        6 - NTILE(5) OVER(ORDER BY newest_day ASC) AS r_score,
        6 - NTILE(5) OVER(ORDER BY total_orders DESC) AS f_score,
        6 - NTILE(5) OVER(ORDER BY total_spent DESC) AS m_score
FROM base_data
)
SELECT *,
        r_score + f_score + m_score AS rfm_total
FROM marking_data
ORDER BY rfm_total DESC, customer_id ASC
