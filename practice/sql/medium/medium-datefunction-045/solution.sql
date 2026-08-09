-- Xom Data · Transaction count and amount by month
-- Problem: https://xomdata.com/practice/medium-datefunction-045
-- Solved: 2026-08-09

WITH cte_table AS
(
SELECT  
STRFTIME('%Y-%m', transaction_date) AS month,
COUNT(DISTINCT id) AS transaction_count,
SUM(amount) AS total_amount
FROM transactions
GROUP BY month
)
SELECT *,
total_amount - (LAG(total_amount,1) OVER(ORDER BY month ASC)) AS mom_delta
FROM cte_table
ORDER BY month ASC
