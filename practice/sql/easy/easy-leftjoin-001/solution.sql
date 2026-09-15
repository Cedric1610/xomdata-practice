-- Xom Data · Users who never took a ride
-- Problem: https://xomdata.com/practice/easy-leftjoin-001
-- Solved: 2026-09-15

SELECT user_name, joined_date
FROM users
WHERE id NOT IN (SELECT DISTINCT user_id FROM rides)
