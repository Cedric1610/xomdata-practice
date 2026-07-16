-- Xom Data · Number of delivered orders
-- Problem: https://xomdata.com/practice/easy-count-002
-- Solved: 2026-07-16

SELECT COUNT(id) AS order_count
FROM orders
WHERE status = "Delivered"
