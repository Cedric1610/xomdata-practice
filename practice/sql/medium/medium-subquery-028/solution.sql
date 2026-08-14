-- Xom Data · Students above the subject average
-- Problem: https://xomdata.com/practice/medium-subquery-028
-- Solved: 2026-08-14

WITH cte_table AS
(
SELECT full_name, subject_name, final_score,
ROUND(AVG(final_score) OVER(PARTITION BY subject_name),2) AS subject_avg,
ROUND(final_score - (AVG(final_score) OVER(PARTITION BY subject_name)),2) AS diff_from_avg
FROM grades AS g 
JOIN students AS s
    ON s.id = g.student_id
JOIN subjects as su 
    ON g.subject_id = su.id
GROUP BY full_name, subject_name
)
SELECT *
FROM cte_table
WHERE final_score > subject_avg
ORDER BY diff_from_avg DESC, subject_name ASC, full_name ASC
