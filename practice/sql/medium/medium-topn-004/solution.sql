-- Xom Data · Each branch's two slowest months
-- Problem: https://xomdata.com/practice/medium-topn-004
-- Solved: 2026-09-12

WITH base_data AS
(
SELECT branch, month, revenue,
DENSE_RANK() OVER(PARTITION BY branch ORDER BY revenue ASC, month ASC) AS ranking
FROM branch_monthly
)
SELECT branch, month, revenue
FROM base_data
WHERE ranking IN (1,2)
ORDER BY branch ASC, revenue ASC, month ASC
