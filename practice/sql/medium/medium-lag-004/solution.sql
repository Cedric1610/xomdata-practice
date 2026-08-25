-- Xom Data · Trend labels for the monthly report
-- Problem: https://xomdata.com/practice/medium-lag-004
-- Solved: 2026-08-25

WITH base_data AS
(
SELECT month, revenue,
LAG(revenue) OVER(ORDER BY month ASC) AS prev_rev
FROM monthly_revenue
)
SELECT month, revenue,
CASE
    WHEN prev_rev IS NULL THEN 'First'
    WHEN revenue > prev_rev THEN 'Up'
    WHEN revenue < prev_rev THEN 'Down'
    ELSE 'Flat'
END AS trend
FROM base_data
ORDER BY month ASC
