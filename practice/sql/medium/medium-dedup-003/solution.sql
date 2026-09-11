-- Xom Data · Latest readings and over-limit alerts
-- Problem: https://xomdata.com/practice/medium-dedup-003
-- Solved: 2026-09-11

SELECT sensor_name, MAX(reading_date) AS reading_date, temp_c, max_temp,
    CASE
        WHEN temp_c > max_temp THEN 'Alert'
        ELSE 'Normal'
    END AS status
FROM readings AS r
LEFT JOIN sensors AS s
    ON r.sensor_id = s.id
GROUP BY sensor_name
ORDER BY sensor_name ASC
