-- Xom Data · Line totals from the price list
-- Problem: https://xomdata.com/practice/easy-join-003
-- Solved: 2026-08-18

SELECT product_name, quantity, (price * quantity) AS line_total
FROM products AS p
JOIN sale_items AS s
    ON p.id = s.product_id
