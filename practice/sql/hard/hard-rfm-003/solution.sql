-- Xom Data · Điểm tươi mới cộng điểm chuyên cần
-- Problem: https://xomdata.com/practice/hard-rfm-003
-- Solved: 2026-08-31

WITH base_data AS
(
SELECT customer_id,
    MAX(order_date) AS newest_day,
    COUNT(order_id) AS order_count
FROM orders
GROUP BY customer_id
), agg_data AS
(
SELECT customer_id,
    (6 - NTILE(5) OVER(ORDER BY newest_day DESC, customer_id ASC)) AS r_score,
    CASE
        WHEN order_count >= 8 THEN 3
        WHEN order_count <= 3 THEN 1
        ELSE 2
    END AS f_score
FROM base_data
)
SELECT *, 
    (r_score + f_score) AS total_score,
    CASE
        WHEN (r_score + f_score) >= 7 THEN 'Gold'
        WHEN (r_score + f_score) < 5 THEN 'Bronze'
        ELSE 'Silver'
    END AS label
FROM agg_data
ORDER BY customer_id ASC
