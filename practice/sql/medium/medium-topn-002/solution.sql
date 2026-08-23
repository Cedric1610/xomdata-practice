-- Xom Data · Top three sellers per category
-- Problem: https://xomdata.com/practice/medium-topn-002
-- Solved: 2026-08-23

WITH cte_table AS
(
SELECT category, product_name, units_sold,
RANK() OVER(PARTITION BY category ORDER BY units_sold DESC, product_name ASC) AS ranking
FROM menu_sales
)
SELECT category, product_name, units_sold
FROM cte_table
WHERE ranking <= 3
ORDER BY category ASC, units_sold DESC, product_name ASC
