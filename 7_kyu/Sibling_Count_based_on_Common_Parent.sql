WITH

-- Table of all parents for each client (child)
parents_of_clients AS
(SELECT
    client_id,
    ARRAY_AGG(parent_id) AS all_parents
FROM client_parents
GROUP BY client_id
ORDER BY client_id)

-- Number of siblings for each client (child)
SELECT
    pc.client_id,
    -- number of siblings are number of all childs minus the current one.
    COUNT(DISTINCT c.client_id) - 1 AS num_siblings
FROM parents_of_clients AS pc
LEFT JOIN client_parents AS c ON c.parent_id = ANY(pc.all_parents)
GROUP BY pc.client_id
ORDER BY pc.client_id;