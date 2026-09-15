-- Xom Data · Deal count per client
-- Problem: https://xomdata.com/practice/easy-join-007
-- Solved: 2026-09-15

SELECT client_name, COUNT(d.id) AS num_deals
FROM deals AS d
JOIN clients AS c
    ON d.client_id = c.id
GROUP BY client_name
ORDER BY num_deals DESC, client_name ASC
