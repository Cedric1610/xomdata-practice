-- Xom Data · Classify products by sales velocity
-- Problem: https://xomdata.com/practice/medium-case-110
-- Solved: 2026-07-16

WITH cte_table AS
(
SELECT name, categories, SUM(quantity) AS total_sold,
CASE   
    WHEN SUM(quantity) >= 100 THEN 'Best Seller'
    WHEN SUM(quantity) < 50 THEN 'Slow Mover'
    ELSE 'Average'
END AS  classification
FROM products AS p 
JOIN transactions AS t 
    ON p.id = t.product_id
GROUP BY name, categories
)
SELECT *,
DENSE_RANK() OVER(PARTITION BY categories ORDER BY total_sold DESC) AS rank_in_cat,
ROUND(total_sold * 100.0 / SUM(total_sold) OVER(PARTITION BY categories), 2) AS pct_of_cat_total
FROM cte_table
ORDER BY categories ASC, rank_in_cat ASC, name ASC;
