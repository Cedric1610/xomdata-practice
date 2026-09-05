-- Xom Data · Top two films per genre, rank included
-- Problem: https://xomdata.com/practice/medium-topn-005
-- Solved: 2026-09-05

WITH base_data AS
(
SELECT title, genre, revenue, DENSE_RANK() OVER(PARTITION BY genre ORDER BY revenue DESC, title ASC) AS rank_in_genre
FROM box_office
)
SELECT genre, rank_in_genre, title, revenue
FROM base_data
WHERE rank_in_genre IN (1,2)
ORDER BY genre ASC, rank_in_genre ASC
