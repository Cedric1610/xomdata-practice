-- Xom Data · Đơn hàng để đời của mỗi khách
-- Problem: https://xomdata.com/practice/medium-monetary-004
-- Solved: 2026-08-24

WITH base_data AS
(
SELECT customer_id, order_id, order_date, amount,
RANK() OVER(PARTITION BY customer_id ORDER BY amount DESC, order_date ASC, order_id ASC) AS ranking
FROM orders
)
SELECT customer_id, order_id, order_date, amount
FROM base_data
WHERE ranking = 1
ORDER BY customer_id ASC
