-- Xom Data · Players with 3 or more goals
-- Problem: https://xomdata.com/practice/medium-having-187
-- Solved: 2026-08-07

WITH player_stats AS (
    SELECT 
        p.id,
        p.full_name, 
        p.positions, 
        t.team_name, 
        COUNT(DISTINCT g.id) AS goal_count, 
        COUNT(DISTINCT g.match_id) AS scoring_matches, 
        COUNT(DISTINCT pe.id) AS cards_received
    FROM players AS p 
    JOIN teams AS t 
        ON t.id = p.team_id
    LEFT JOIN goals AS g 
        ON g.player_id = p.id
    LEFT JOIN penalties AS pe 
        ON pe.player_id = p.id
    GROUP BY p.id, p.full_name, p.positions, t.team_name
),
filtered_players AS (
    SELECT 
        full_name,
        positions,
        team_name,
        goal_count,
        scoring_matches,
        cards_received,
        ROUND(goal_count * 1.0 / scoring_matches, 2) AS goals_per_match
    FROM player_stats
    WHERE goal_count >= 3 
      AND cards_received < 5
)
SELECT 
    full_name,
    positions,
    team_name,
    goal_count,
    scoring_matches,
    cards_received,
    goals_per_match,
    DENSE_RANK() OVER(ORDER BY goals_per_match DESC) AS efficiency_rank,
    RANK() OVER(ORDER BY goal_count DESC) AS volume_rank
FROM filtered_players
ORDER BY efficiency_rank ASC, full_name ASC;
