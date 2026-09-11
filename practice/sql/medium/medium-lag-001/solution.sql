-- Xom Data · Last month's revenue next to each month
-- Problem: https://xomdata.com/practice/medium-lag-001
-- Solved: 2026-09-11

SELECT month, revenue,
LAG(revenue,1) OVER(ORDER BY month ASC) AS prev_revenue
FROM monthly_revenue
ORDER BY month ASC
