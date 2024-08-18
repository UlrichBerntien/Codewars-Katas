-- Count car types in traffic observations
-- at traffic light id 1
-- before or after a black bmw
WITH

events_around_black_bmw AS
    -- Collect the rows before and after a black bmw.
    -- Ignore all cars seen at traffic light id other than 1.
    (SELECT
        lead_id,
        lag_id
    FROM
        (SELECT
            type='black bmw' AS matching,
            LEAD(id) OVER (ORDER BY datetime) AS lead_id,
            LAG(id) OVER (ORDER BY datetime) AS lag_id
        FROM
            traffic_observations
        WHERE
            traffic_light_id = 1) AS events_around
    WHERE matching)

-- Count the car types.
-- Counts a car twice if there is a black bwm before and after the car.
SELECT
    type AS type_neighbour,
    COUNT(*)
FROM
    events_around_black_bmw
INNER JOIN
    traffic_observations ON lead_id = id OR lag_id = id
GROUP BY
    type
ORDER BY
    count DESC, type_neighbour ASC
;
