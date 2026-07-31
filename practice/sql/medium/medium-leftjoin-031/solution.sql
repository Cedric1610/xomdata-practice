-- Xom Data · Candidates not yet interviewed
-- Problem: https://xomdata.com/practice/medium-leftjoin-031
-- Solved: 2026-07-31

WITH cte_table AS
(
SELECT full_name, email, application_date
FROM candidates
WHERE id NOT IN (SELECT DISTINCT(candidate_id) FROM interviews)
)
SELECT *,
RANK() OVER(ORDER BY application_date ASC, full_name ASC) AS queue_position,
ROUND(PERCENT_RANK() OVER(ORDER BY application_date ASC) * 100.0 ,2) AS older_than_pct
FROM cte_table
ORDER BY queue_position ASC
