WITH RECURSIVE employee_levels(id,manager_id,level) AS (
  SELECT
    top.id, top.manager_id, 1
  FROM employees AS top
  WHERE top.manager_id IS NULL
  UNION ALL
    SELECT
      slave.id, slave.manager_id, manager.level+1
    FROM employees AS slave
    JOIN employee_levels AS manager ON manager.id = slave.manager_id
)
SELECT
  levels.level,
  base.*
FROM employee_levels AS levels
JOIN employees AS base ON base.id = levels.id
ORDER BY level;