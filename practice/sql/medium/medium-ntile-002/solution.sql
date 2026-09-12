-- Xom Data · Splitting deliveries into three shifts by order time
-- Problem: https://xomdata.com/practice/medium-ntile-002
-- Solved: 2026-09-12

SELECT order_code, order_time,
NTILE(3) OVER(ORDER BY order_time ASC, order_code ASC) AS delivery_shift
FROM morning_orders
ORDER BY delivery_shift ASC, order_time ASC, order_code ASC
