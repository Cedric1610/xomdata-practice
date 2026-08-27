-- Xom Data · Customers in key cities
-- Problem: https://xomdata.com/practice/easy-in-001
-- Solved: 2026-08-27

SELECT customer_name, city
FROM customers
WHERE city IN ('Hanoi', 'Da Nang', 'Ho Chi Minh City')
