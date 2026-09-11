-- Xom Data · Salary bands within each department
-- Problem: https://xomdata.com/practice/medium-denserank-002
-- Solved: 2026-09-11

SELECT department,
    DENSE_RANK() OVER(PARTITION BY department ORDER BY salary DESC) AS salary_tier,
    full_name, salary
FROM employees
ORDER BY department ASC, salary_tier ASC, full_name ASC
