WITH

-- Table of all employees (sub_id) direct or indirect managed by each manager (manager_id).
RECURSIVE deep_table AS
  (SELECT
      manager_id,
      id AS sub_id
   FROM employees
   WHERE manager_id IS NOT NULL
   UNION
   SELECT
      deep_table.manager_id,
      employees.id AS sub_id
   FROM deep_table
   JOIN employees ON employees.manager_id = deep_table.sub_id)

-- Table of the managers
-- with count of all direct and indirect employees,
-- average experince of the employees,
-- and names of the employees.
SELECT
    dt.manager_id,
    COUNT(dt.sub_id) AS total_subordinates,
    ROUND(AVG(experience),1) AS average_experience,
    STRING_AGG(name, ', ' ORDER BY dt.sub_id ASC) AS employee_names
FROM deep_table AS dt
JOIN employees ON employees.id = dt.sub_id
GROUP BY dt.manager_id
ORDER BY total_subordinates DESC, dt.manager_id ASC
LIMIT 5;
