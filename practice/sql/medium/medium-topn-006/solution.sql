-- Xom Data · Valedictorian, salutatorian, and the score gap
-- Problem: https://xomdata.com/practice/medium-topn-006
-- Solved: 2026-09-05

WITH base_data AS
(
SELECT *, DENSE_RANK() OVER(PARTITION BY class_name ORDER BY score DESC, student_name ASC) AS position
FROM students
)
SELECT class_name, position, student_name, score, (MAX(score) OVER(PARTITION BY class_name) - score) AS behind_top
FROM base_data
WHERE position IN (1,2)
ORDER BY class_name ASC, position ASC
