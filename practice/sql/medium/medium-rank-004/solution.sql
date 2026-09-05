-- Xom Data · National rank and province rank
-- Problem: https://xomdata.com/practice/medium-rank-004
-- Solved: 2026-09-05

SELECT student_name, province, exam_score,
    RANK() OVER(ORDER BY exam_score DESC) AS national_rank,
    RANK() OVER(PARTITION BY province ORDER BY exam_score DESC) AS province_rank
FROM students
ORDER BY national_rank ASC, student_name ASC
