SELECT
    rank() OVER (ORDER BY total_points DESC) AS rank,
    CASE clan
        WHEN '' THEN '[no clan specified]'
        ELSE clan END
        AS clan,
    total_points,
    total_people
FROM
    (SELECT
        clan,
        sum(points) AS total_points,
        count(name) AS total_people
    FROM people
    GROUP BY clan) AS summary
ORDER BY total_points DESC;