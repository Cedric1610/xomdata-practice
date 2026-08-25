-- Xom Data · Revenue pivoted by product type
-- Problem: https://xomdata.com/practice/hard-pivot-001
-- Solved: 2026-08-25

SELECT strftime('%Y-%m', sale_date) AS month,
COALESCE(SUM
(CASE
    WHEN category = 'Electronics' THEN amount
    ELSE 0
END),0) AS electronics,
COALESCE(SUM
(CASE
    WHEN category = 'Clothing' THEN amount
    ELSE 0
END),0) AS clothing,
COALESCE(SUM
(CASE
    WHEN category = 'Food' THEN amount
    ELSE 0
END),0) AS food,
SUM(amount) AS total
FROM sales
GROUP BY month
ORDER BY month ASC
