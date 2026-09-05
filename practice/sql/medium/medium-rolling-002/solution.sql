-- Xom Data · Three-day rolling total per store
-- Problem: https://xomdata.com/practice/medium-rolling-002
-- Solved: 2026-09-05

SELECT store, sale_date, units_sold,
    SUM(units_sold) OVER(PARTITION BY store ORDER BY sale_date ASC ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) AS sum_3d
FROM daily_sales
ORDER BY store ASC, sale_date ASC
