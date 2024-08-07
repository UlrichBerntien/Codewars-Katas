-- Sum of speed delta for each person.
WITH
    -- Prepare the speed delta sums in a table based on the records table.
    records_summary AS
    (SELECT
        person_id,
        SUM(speed_delta) AS total_speed_delta
    FROM
        records
    WHERE
        -- exclude records not assign to a person.
        person_id IS NOT NULL
    GROUP BY
        person_id)

-- Person with id and birthdate, the sum of all speed delta records.
SELECT
    people.id AS person_id,
    birthdate,
    COALESCE(total_speed_delta,0) AS total_speed_delta
FROM
    people
LEFT JOIN
    records_summary ON people.id = records_summary.person_id
ORDER BY
    people.id ASC;  
