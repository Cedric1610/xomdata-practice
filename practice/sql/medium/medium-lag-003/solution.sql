-- Xom Data · Last month per branch
-- Problem: https://xomdata.com/practice/medium-lag-003
-- Solved: 2026-08-25

SELECT branch, month, revenue,
LAG(revenue,1) OVER(PARTITION BY branch ORDER BY month ASC) AS prev_revenue
FROM branch_revenue
ORDER BY branch ASC, month ASC
