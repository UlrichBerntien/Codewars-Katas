-- The names of the users and their pets, but only pet names start with M.
SELECT
    id,
    user_name,
    STRING_AGG(pet_name, ', ') AS pet_names
FROM
    (SELECT DISTINCT ON(id)
        id,
        info ->> 'name' AS user_name,
        jsonb_path_query(info,'$.pets[*].name ? (@ STARTS WITH "M")')->>0 AS pet_name
    FROM users
    ORDER BY id) AS sub
GROUP BY id, user_name
ORDER BY id;
