-- Xom Data · Ward headcount next to each nurse
-- Problem: https://xomdata.com/practice/medium-winagg-005
-- Solved: 2026-09-08

SELECT ward, nurse_name,
    COUNT(nurse_name) OVER(PARTITION BY ward) AS team_size
FROM roster
ORDER BY ward ASC, nurse_name ASC
