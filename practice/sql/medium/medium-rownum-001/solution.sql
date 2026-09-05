-- Xom Data · Interview call numbers
-- Problem: https://xomdata.com/practice/medium-rownum-001
-- Solved: 2026-09-05

SELECT ROW_NUMBER() OVER(ORDER BY score DESC, candidate_name ASC) AS call_no, candidate_name, score
FROM candidates
ORDER BY score DESC, candidate_name ASC, call_no ASC
