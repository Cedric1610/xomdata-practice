-- Xom Data · Top 10 most-borrowed books
-- Problem: https://xomdata.com/practice/medium-subquery-198
-- Solved: 2026-09-07

WITH base_data AS
(
SELECT title, full_name AS authors, publisher_name, genre_name, 
    COUNT(bl.id) AS borrow_count,
    SUM( DISTINCT
        CASE
            WHEN status = 'ready_pickup' THEN r.book_id
            ELSE ''
        END
    ) AS pending_reservation
FROM books AS b
LEFT JOIN authors AS a
    ON b.author_id = a.id
LEFT JOIN publishers AS p
    ON b.publisher_id = p.id
LEFT JOIN genres AS g
    ON b.genre_id = g.id
LEFT JOIN book_loans AS bl 
    ON b.id = bl.book_id
LEFT JOIN reservations AS r
    ON b.id = r.book_id
GROUP BY title, authors, publisher_name, genre_name
)
SELECT *, (borrow_count + pending_reservation) AS engagement,
    DENSE_RANK() OVER(ORDER BY (borrow_count + pending_reservation) DESC) AS overall_rank,
    RANK() OVER(PARTITION BY genre_name ORDER BY (borrow_count + pending_reservation) DESC) AS rank_in_genre
FROM base_data
ORDER BY overall_rank ASC, title ASC
LIMIT 10
