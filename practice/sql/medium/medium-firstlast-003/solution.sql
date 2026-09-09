-- Xom Data · Ấn tượng đầu tiên trị giá bao nhiêu
-- Problem: https://xomdata.com/practice/medium-firstlast-003
-- Solved: 2026-09-09

SELECT  customer_id, MIN(order_date) AS first_order_date, amount AS first_amount
FROM orders
GROUP BY customer_id
ORDER BY customer_id ASC
