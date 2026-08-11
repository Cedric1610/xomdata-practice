-- Xom Data · Instructor teaching load
-- Problem: https://xomdata.com/practice/medium-join-029
-- Solved: 2026-08-11

WITH cte_table AS
(
SELECT full_name, academic_degree, COUNT(DISTINCT s.id) AS subjects_taught
FROM lecturers AS l
JOIN subjects AS s 
    ON l.id = s.lecturer_id
GROUP BY full_name, academic_degree
)
SELECT *,
DENSE_RANK() OVER(ORDER BY subjects_taught DESC) AS workload_rank,
SUM(subjects_taught) OVER(ORDER BY subjects_taught DESC, full_name ASC)  cumulative_subjects
FROM cte_table
ORDER BY workload_rank ASC, full_name ASC
