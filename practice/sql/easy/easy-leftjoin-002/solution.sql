-- Xom Data · Total spend per member
-- Problem: https://xomdata.com/practice/easy-leftjoin-002
-- Solved: 2026-09-01

SELECT member_name, COALESCE(SUM(amount),0) AS total_spent
FROM members AS m
LEFT JOIN bills AS b
    ON m.id = b.member_id
GROUP BY member_name
