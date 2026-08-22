-- Xom Data · Kim cương, vàng hay thành viên thường
-- Problem: https://xomdata.com/practice/medium-classify-001
-- Solved: 2026-08-22

SELECT customer_id,
SUM(amount) AS total_spent,
CASE
    WHEN SUM(amount) >= 10000000 THEN 'Diamond'
    WHEN SUM(amount) < 3000000 THEN 'Member'
    ELSE 'Gold'
END AS tier
FROM orders
GROUP BY customer_id
