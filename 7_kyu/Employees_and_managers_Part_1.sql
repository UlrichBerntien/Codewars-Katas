-- Generate table:
--    manager_id = id of the manager, sorted ascending.
--    employee_names = names of all employees of the manager, format "name (id)"
SELECT
  manager_id,
  array_agg(name||' ('||id||')' ORDER BY id) AS employee_names
FROM employees
WHERE manager_id IS NOT NULL
GROUP BY manager_id
ORDER BY manager_id ASC;
