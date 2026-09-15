-- Xom Data · Customers who ever bought skincare
-- Problem: https://xomdata.com/practice/easy-join-006
-- Solved: 2026-09-15

SELECT DISTINCT customer_name
FROM purchases AS p
JOIN customers AS c
    ON p.customer_id = c.id
WHERE category = 'Skincare'
