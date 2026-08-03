-- Xom Data · Top 3 products by sales in each category
-- Problem: https://xomdata.com/practice/hard-topn-001
-- Solved: 2026-08-03

WITH cte_table AS
(
SELECT category, name AS product_name, units_sold,
DENSE_RANK() OVER(PARTITION BY category ORDER BY units_sold DESC) AS rank_in_cat
FROM products
)
SELECT *
FROM cte_table
WHERE rank_in_cat <= 3
ORDER BY category ASC, rank_in_cat ASC, product_name ASC
