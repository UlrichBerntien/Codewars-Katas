-- Table of managers with the 3 most experienced subordinates.
SELECT
    sub.manager_id,
    manager.name AS manager_name,
    FORMAT('%s years',manager.experience) AS manager_experience,
    FORMAT('%s (%s)',subordinate_name,subordinate_rank) AS subordinate_name,
    FORMAT('%s years',subordinate_experience) AS subordinate_experience,
    subordinate_id,
    manager.experience > AVG(subordinate_experience) OVER (PARTITION BY sub.manager_id) AS is_manager_experience_higher
FROM
    -- Table of subordinates ranked by experience.
    (SELECT
        manager_id,
        name AS subordinate_name,
        RANK() OVER (PARTITION BY manager_id ORDER BY experience DESC, id ASC) AS subordinate_rank,
        id AS subordinate_id,
        experience AS subordinate_experience
    FROM employees
    WHERE manager_id IS NOT NULL) AS sub
JOIN employees AS manager ON manager.id = sub.manager_id
WHERE subordinate_rank <= 3
ORDER BY manager_id, subordinate_rank;
