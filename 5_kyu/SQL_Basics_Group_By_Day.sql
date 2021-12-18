SELECT
    count(*) AS count,
    created_at::Date AS day,
    description
FROM events
WHERE name = 'trained'
GROUP BY day, description;