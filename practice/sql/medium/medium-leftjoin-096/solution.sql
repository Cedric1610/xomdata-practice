-- Xom Data · Accounts with no posts
-- Problem: https://xomdata.com/practice/medium-leftjoin-096
-- Solved: 2026-08-02

SELECT full_name, username, account_type,
RANK() OVER(ORDER BY created_at ASC, username ASC) AS signup_order,
NTILE(4) OVER(ORDER BY created_at ASC) AS tenure_quartile
FROM users
WHERE id NOT IN (SELECT DISTINCT user_id FROM posts)
ORDER BY signup_order ASC
