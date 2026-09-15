-- Xom Data · Ticket statuses guests can read
-- Problem: https://xomdata.com/practice/easy-join-005
-- Solved: 2026-09-15

SELECT ticket_code, status_name
FROM tickets AS t
JOIN statuses AS s
    ON t.status_code = s.code
