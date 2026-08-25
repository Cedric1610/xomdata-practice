-- Xom Data · Change versus last month
-- Problem: https://xomdata.com/practice/medium-lag-002
-- Solved: 2026-08-25

SELECT month, revenue,
revenue - LAG(revenue,1) OVER(ORDER BY month ASC) AS mom_change
FROM monthly_revenue
ORDER BY month ASC
