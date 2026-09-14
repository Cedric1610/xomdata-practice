-- Xom Data · Shift bonus for every top performer
-- Problem: https://xomdata.com/practice/medium-topn-003
-- Solved: 2026-09-14

SELECT store, staff_name, orders_served
FROM
(
SELECT store, staff_name, orders_served,
DENSE_RANK() OVER(PARTITION BY store ORDER BY orders_served DESC) AS ranking
FROM shift_stats
) AS sub_query
WHERE ranking = 1
ORDER BY store ASC, staff_name ASC
