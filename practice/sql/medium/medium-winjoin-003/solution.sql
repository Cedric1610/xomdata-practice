-- Xom Data · Each aisle's best seller
-- Problem: https://xomdata.com/practice/medium-winjoin-003
-- Solved: 2026-08-28

WITH base_data AS 
(
SELECT category_name, product_name, units_sold, RANK() OVER(PARTITION BY category_name ORDER BY units_sold DESC, product_name ASC)  AS ranking
FROM products AS p
JOIN categories AS c
    ON p.category_id = c.id
)
SELECT category_name, product_name, units_sold
FROM base_data
WHERE ranking = 1
ORDER BY category_name ASC
