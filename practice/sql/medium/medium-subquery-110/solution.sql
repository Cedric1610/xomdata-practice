-- Xom Data · Employees paid above their department average
-- Problem: https://xomdata.com/practice/medium-subquery-110
-- Solved: 2026-07-30

WITH cte_table AS 
(
SELECT full_name, dept_name, salary,
ROUND(AVG(salary) OVER(PARTITION BY dept_name),0) AS dept_avg_salary
FROM departments AS d 
JOIN employees AS e 
    ON d.id = e.department_id

)
SELECT *,
ROUND(ABS((salary - dept_avg_salary) * 100.0/ dept_avg_salary),2) AS premium_pct
FROM cte_table
WHERE salary > dept_avg_salary
ORDER BY premium_pct DESC, dept_name ASC, full_name ASC
