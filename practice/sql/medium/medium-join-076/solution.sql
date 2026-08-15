-- Xom Data · Showtime count and average ticket price per film
-- Problem: https://xomdata.com/practice/medium-join-076
-- Solved: 2026-08-15

WITH cte_table AS
(
SELECT movie_name, genres, COUNT(DISTINCT s.id) AS showtime_count, ROUND(AVG(ticket_price),0) AS avg_ticket_price
FROM showtimes AS s 
JOIN movies AS m
    ON s.movie_id = m.id
GROUP BY movie_name, genres
)
SELECT *,
DENSE_RANK() OVER(PARTITION BY genres ORDER BY avg_ticket_price DESC) AS rank_in_genre,
FIRST_VALUE(movie_name) OVER(PARTITION BY genres ORDER BY avg_ticket_price DESC) AS top_movie_in_genre
FROM cte_table
ORDER BY genres ASC, rank_in_genre ASC, movie_name ASC
