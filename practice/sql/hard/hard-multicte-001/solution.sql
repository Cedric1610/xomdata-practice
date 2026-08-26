-- Xom Data · Multi-level profit margin analysis
-- Problem: https://xomdata.com/practice/hard-multicte-001
-- Solved: 2026-08-26

WITH base_data AS
(
SELECT category, name AS product_name, 
SUM(quantity * price) AS revenue,
SUM(quantity * unit_cost) AS cost,
SUM(quantity * price) -  SUM(quantity * unit_cost) AS profit,
ROUND((SUM(quantity * price) -  SUM(quantity * unit_cost)) * 100.0/SUM(quantity * price),2) AS margin_pct
FROM products AS p
JOIN orders AS o
    ON p.id = o.product_id
GROUP BY category, name
)
SELECT *,
DENSE_RANK() OVER(PARTITION BY category ORDER BY profit DESC) AS rank_in_cat,
ROUND(profit * 100.0 / MAX(profit) OVER(PARTITION BY category),2) AS pct_of_top_in_cat
FROM base_data
ORDER BY category ASC, rank_in_cat ASC, product_name ASC
