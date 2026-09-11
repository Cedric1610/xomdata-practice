-- Xom Data · YoY and QoQ sales growth
-- Problem: https://xomdata.com/practice/hard-yoy-001
-- Solved: 2026-09-11

WITH base_data AS
(
SELECT year, quarter, revenue,
    LAG(revenue,1) OVER(ORDER BY year ASC, quarter ASC) AS prev_quarter_revenue,
    LAG(revenue,4) OVER(ORDER BY year ASC, quarter ASC) AS prev_year_revenue
FROM quarterly_sales
)
SELECT *,
ROUND((revenue - prev_quarter_revenue) * 100.0/prev_quarter_revenue,2) AS qoq_pct,
ROUND((revenue - prev_year_revenue) * 100.0/prev_year_revenue,2) yoy_pct
FROM base_data
ORDER BY year ASC, quarter ASC
