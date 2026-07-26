-- Xom Data · Detect anomalous days vs the average
-- Problem: https://xomdata.com/practice/hard-anomaly-001
-- Solved: 2026-07-26

WITH mean_calc AS (
    SELECT AVG(value) AS raw_mean
    FROM daily_metrics
),
stats AS (
    SELECT 
        ROUND(m.raw_mean, 2) AS mean,
        ROUND(SQRT(AVG((d.value - m.raw_mean) * (d.value - m.raw_mean))), 2) AS stddev
    FROM daily_metrics d
    CROSS JOIN mean_calc m
),
z_score_calc AS (
    SELECT 
        d.date,
        d.value,
        s.mean,
        s.stddev,
        CASE 
            WHEN s.stddev = 0 THEN 0
            ELSE ROUND((d.value - s.mean) / s.stddev, 2)
        END AS z_score
    FROM daily_metrics d
    CROSS JOIN stats s
)
SELECT 
    date,
    value,
    mean,
    stddev,
    z_score,
    CASE 
        WHEN z_score > 2 THEN 'high'
        WHEN z_score < -2 THEN 'low'
        ELSE 'normal'
    END AS flag
FROM z_score_calc
ORDER BY date ASC;
