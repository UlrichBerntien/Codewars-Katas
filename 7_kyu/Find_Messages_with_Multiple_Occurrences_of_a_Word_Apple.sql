-- Position of the second word 'apple' inside the message.
SELECT
    id,
    message,
    first_occurrence_position+position('apple' IN substr(lower_message,first_occurrence_position+1)) AS second_occurrence_position
FROM
     (SELECT
        id,
        message,
        lower(message) AS lower_message,
        position('apple' IN lower(message)) AS first_occurrence_position
    FROM
        messages
    WHERE
        message ILIKE '%apple%apple%') AS first
ORDER BY
    id DESC;