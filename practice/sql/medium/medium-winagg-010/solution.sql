-- Xom Data · Regional payroll with shares
-- Problem: https://xomdata.com/practice/medium-winagg-010
-- Solved: 2026-09-07

SELECT region, staff_name, salary, 
    SUM(salary) OVER(PARTITION BY region) AS region_total,
    ROUND(salary * 100.00 / SUM(salary) OVER(PARTITION BY region),2) AS pct_of_region
FROM payroll
ORDER BY region ASC, salary DESC, staff_name ASC
