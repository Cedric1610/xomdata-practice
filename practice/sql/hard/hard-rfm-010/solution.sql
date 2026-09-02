-- Xom Data · Tấm bản đồ mười một bộ lạc khách hàng
-- Problem: https://xomdata.com/practice/hard-rfm-010
-- Solved: 2026-09-02

WITH agg_data AS
(
SELECT customer_id, 
    COUNT(order_id) AS orders_count,
    SUM(amount) AS revenue,
    MAX(order_date) AS newest_order
FROM orders
WHERE order_date <= '2024-06-30'
GROUP BY customer_id
), scoring AS
(
SELECT *,
6 - NTILE(5) OVER(ORDER BY newest_order DESC, customer_id ASC) AS R,
6 - NTILE(5) OVER(ORDER BY orders_count DESC, customer_id ASC) AS F
FROM agg_data
), classify AS
(
SELECT *,
    CASE
        WHEN R = 5 AND F >= 4 THEN 'Champions'
        WHEN R >= 4 AND F >= 3 THEN 'Loyal'
        WHEN R >= 4 AND F >= 1 THEN 'Potential Loyalist'
        WHEN R = 3 AND F >= 4 THEN 'Need Attention'
        WHEN R = 3 AND F >= 2 THEN 'About To Sleep'
        WHEN R = 3 THEN 'Promising'
        WHEN R = 2 AND F >= 4 THEN 'At Risk'
        WHEN R = 2 AND F >= 2 THEN 'Hibernating'
        WHEN R = 2 THEN 'Lost Cheap'
        WHEN R = 1 AND F >= 3 THEN 'Cannot Lose Them'
        ELSE 'Lost'
    END AS segment
FROM scoring
)
SELECT segment, COUNT(customer_id) AS customer_count
FROM classify
GROUP BY segment
ORDER BY customer_count DESC, segment ASC
