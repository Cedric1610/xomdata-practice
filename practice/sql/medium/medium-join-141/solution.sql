-- Xom Data · Consultation revenue by doctor
-- Problem: https://xomdata.com/practice/medium-join-141
-- Solved: 2026-08-16

WITH base_data AS
(
SELECT faculty_name, full_name AS doctor_name, 
COUNT(DISTINCT m.id) AS visit_count,
AVG(visit_fee) AS avg_exam_fee,
SUM(visit_fee) AS total_exam_fee
FROM doctors AS d
JOIN faculties AS f 
    ON d.faculty_id = f.id
JOIN medical_visits AS m
    ON d.id = m.doctor_id
GROUP BY faculty_name, doctor_name
)
SELECT *,
DENSE_RANK() OVER(ORDER BY total_exam_fee DESC) AS overall_rank,
RANK() OVER(PARTITION BY faculty_name ORDER BY total_exam_fee DESC) AS rank_in_faculty
FROM base_data
ORDER BY total_exam_fee DESC, doctor_name ASC
LIMIT 15
