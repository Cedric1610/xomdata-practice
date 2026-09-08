-- Xom Data · How far from the server's top
-- Problem: https://xomdata.com/practice/medium-winagg-004
-- Solved: 2026-09-08

SELECT server, player_name, points,
    MAX(points) OVER(PARTITION BY server) - points AS gap_to_top
FROM players
ORDER BY server ASC, points DESC, player_name ASC
