-- Xom Data · Category price range next to each item
-- Problem: https://xomdata.com/practice/medium-winagg-008
-- Solved: 2026-09-04

SELECT category, product_name, price,
MIN(price) OVER(PARTITION BY category) AS cat_min,
MAX(price) OVER(PARTITION BY category) AS cat_max
FROM products
GROUP BY category, product_name
ORDER BY category ASC, price ASC, product_name ASC
