-- Xom Data · Today's showtimes in time order
-- Problem: https://xomdata.com/practice/easy-join-004
-- Solved: 2026-09-15

SELECT start_time, title, screen
FROM movies AS m
JOIN showtimes AS s
    ON m.id = s.movie_id
ORDER BY start_time ASC, title ASC
