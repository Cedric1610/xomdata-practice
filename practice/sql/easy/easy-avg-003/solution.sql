-- Xom Data · Average score in Math
-- Problem: https://xomdata.com/practice/easy-avg-003
-- Solved: 2026-09-02

SELECT AVG(score) AS avg_score
FROM exam_scores
WHERE subject = 'Math'
