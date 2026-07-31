-- Xom Data · Book count and average price by genre
-- Problem: https://xomdata.com/practice/medium-coalesce-040
-- Solved: 2026-07-31

WITH cte_table AS
(
SELECT genre_name, COALESCE(COUNT(b.genre_id),0) AS book_count, ROUND(COALESCE(AVG(price),0),0) AS avg_price, COALESCE(MIN(price),0) AS min_price, COALESCE(MAX(price),0) AS max_price, COALESCE((MAX(price)- MIN(price)),0) AS price_range
FROM genres AS g 
LEFT JOIN books AS b 
    ON g.id = b.genre_id
GROUP BY g.id
)
SELECT *,
RANK() OVER(ORDER BY book_count DESC) AS coverage_rank,
NTILE(3) OVER (ORDER BY book_count DESC) AS library_focus
FROM cte_table
ORDER BY coverage_rank ASC, genre_name ASC
