-- Xom Data · Orders during the promo period
-- Problem: https://xomdata.com/practice/easy-between-002
-- Solved: 2026-09-03

SELECT order_code, order_date, total_amount
FROM orders
WHERE order_date >= '2025-06-01' AND order_date <= '2025-06-30'
