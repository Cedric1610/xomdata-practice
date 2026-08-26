-- Xom Data · Ai đã tiêu vượt mốc năm triệu
-- Problem: https://xomdata.com/practice/medium-monetary-001
-- Solved: 2026-08-26

SELECT customer_id, SUM(amount) AS total_spent,
CASE
    WHEN SUM(amount) >= 5000000 THEN 'VIP'
    ELSE 'Standard'
END AS segment
FROM orders
GROUP BY customer_id
