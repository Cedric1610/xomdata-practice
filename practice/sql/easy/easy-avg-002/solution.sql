-- Xom Data · The cafe's average rating
-- Problem: https://xomdata.com/practice/easy-avg-002
-- Solved: 2026-08-08

SELECT ROUND(AVG(rating),2) AS avg_rating
FROM reviews
