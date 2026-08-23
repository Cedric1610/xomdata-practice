-- Xom Data · Sales champion of each region
-- Problem: https://xomdata.com/practice/medium-topn-001
-- Solved: 2026-08-23

WITH cte_table AS
(
SELECT region, rep_name, sales_amount,
RANK() OVER(PARTITION BY region ORDER BY sales_amount DESC, rep_name ASC) AS ranking
FROM reps
)
SELECT region, rep_name, sales_amount
FROM cte_table
WHERE ranking = 1
ORDER BY region ASC
