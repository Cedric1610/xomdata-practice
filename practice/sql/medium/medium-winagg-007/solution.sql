-- Xom Data · Above or below the department norm
-- Problem: https://xomdata.com/practice/medium-winagg-007
-- Solved: 2026-09-04

SELECT department, full_name, salary,
    CASE
        WHEN AVG(salary) OVER(PARTITION BY department) < salary THEN 'Above'
        WHEN AVG(salary) OVER(PARTITION BY department) > salary THEN 'Below'
        ELSE 'Equal'
    END AS position_label
FROM employees
GROUP BY department, full_name
ORDER BY department ASC, full_name ASC
