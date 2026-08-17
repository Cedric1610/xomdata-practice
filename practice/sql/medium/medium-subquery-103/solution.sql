-- Xom Data · Products more expensive than the category average
-- Problem: https://xomdata.com/practice/medium-subquery-103
-- Solved: 2026-08-17

WITH base_data AS
(
SELECT product_name, category, price,
AVG(price) OVER(PARTITION BY category) AS avg_category,
ROUND(price - AVG(price) OVER(PARTITION BY category),0) AS diff_from_avg
FROM products
), filtering_data AS
(
SELECT product_name, category, price, diff_from_avg
FROM base_data
WHERE price > avg_category
)
SELECT *,
ROUND((diff_from_avg * 100.0)/(price - diff_from_avg),2) AS pct_above
FROM filtering_data
ORDER BY pct_above DESC, product_name ASC
