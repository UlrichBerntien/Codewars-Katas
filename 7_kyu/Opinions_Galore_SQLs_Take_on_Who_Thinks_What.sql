--  Sorted table of opinion changes among individuals, with special emphasis on handling NULL values
SELECT
    giver.name AS opinion_giver,
    receiver.name AS opinion_receiver,
    opinions.current_opinion,
    opinions.previous_opinion
FROM
    people_opinions AS opinions
LEFT JOIN
    people AS giver ON giver.person_id = opinions.opinion_giver_id
LEFT JOIN
    people AS receiver ON receiver.person_id = opinions.person_id
WHERE
    -- do not exclude NULL values from the table
    opinions.current_opinion IS DISTINCT FROM opinions.previous_opinion
ORDER BY
    giver.name ASC,
    receiver.name ASC;