-- Xom Data · Price tiers for rooms on sale
-- Problem: https://xomdata.com/practice/medium-denserank-001
-- Solved: 2026-09-11

SELECT room_no, price,
    DENSE_RANK() OVER(ORDER BY price DESC) AS price_tier
FROM rooms
ORDER BY price_tier ASC, room_no ASC
