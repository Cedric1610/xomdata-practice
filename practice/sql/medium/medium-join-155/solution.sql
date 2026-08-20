-- Xom Data · Rank hotels by room price within each destination
-- Problem: https://xomdata.com/practice/medium-join-155
-- Solved: 2026-08-20

WITH base_data AS
(
SELECT hotel_name,star_class, destination_name,
COUNT(hotel_id) AS room_count,
MIN(nightly_rate) AS min_price,
MAX(nightly_rate) AS max_price,
AVG(nightly_rate) AS avg_price,
(MAX(nightly_rate) - MIN(nightly_rate)) AS price_spread
FROM hotels AS h
JOIN destinations AS d
    ON h.destination_id = d.id
JOIN hotel_rooms AS hr
    ON h.id = hr.hotel_id
GROUP BY hotel_name, star_class, destination_name
HAVING room_count >= 2
)
SELECT *,
RANK() OVER(PARTITION BY destination_name ORDER BY avg_price DESC) AS rank_in_destination
FROM base_data
ORDER BY destination_name ASC, rank_in_destination ASC, hotel_name ASC
