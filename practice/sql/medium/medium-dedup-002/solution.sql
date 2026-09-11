-- Xom Data · The current price of each product
-- Problem: https://xomdata.com/practice/medium-dedup-002
-- Solved: 2026-09-11

SELECT product_name, price, MAX(effective_date) AS effective_date
FROM price_history
GROUP BY product_name
ORDER BY product_name ASC
