-- Xom Data · Average score per subject
-- Problem: https://xomdata.com/practice/medium-groupby-027
-- Solved: 2026-07-26

WITH cte_table AS
(
SELECT subject_name, credits, 
    COUNT(subject_name) AS student_count,
    ROUND(AVG(final_score),2) AS avg_score,
    ROUND(SUM(
        CASE
            WHEN final_score >= 5 THEN 1
            ELSE 0
            END
    ) * 100.0 /COUNT(subject_name),2) AS pass_rate
FROM subjects AS s 
JOIN grades as g 
    ON s.id = g.subject_id
GROUP BY subject_name
)
SELECT *,
DENSE_RANK() OVER(ORDER BY avg_score DESC) AS rank_by_avg,
NTILE(4) OVER(ORDER BY avg_score DESC) AS difficulty_quartile
FROM cte_table
ORDER BY rank_by_avg ASC, subject_name ASC
