-- Sorted table.
SELECT
    id,
    group_id,
    recipe,
    priority
FROM recipe_priority
ORDER BY
    group_id ASC,
    MAX(priority) OVER (PARTITION BY group_id, recipe) DESC,
    recipe ASC,
    priority DESC,
    ID DESC;