-- Xom Data · Sổ chi tiêu quý hai, kể cả người im lặng
-- Problem: https://xomdata.com/practice/medium-monetary-003
-- Solved: 2026-08-31

SELECT c.customer_id, customer_name,
SUM
(
    CASE
        WHEN order_date >= '2024-04-01' AND order_date <= '2024-06-30' THEN amount
        ELSE 0
    END
) AS q2_spent
FROM orders AS o
RIGHT JOIN customers AS c
    ON o.customer_id = c.customer_id
GROUP BY o.customer_id
ORDER BY q2_spent DESC, c.customer_id ASC
