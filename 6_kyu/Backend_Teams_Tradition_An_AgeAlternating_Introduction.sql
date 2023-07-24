-- Get the backend team members in up-down-age sorted.
-- up-down-age sort: youngest, oldest, second youngest, second oldest ...
WITH

index_backends AS
(SELECT
  employee_id,
  full_name,
  team,
  birth_date,
  DENSE_RANK() OVER (ORDER BY birth_date ASC ,employee_id ASC ) AS down_index,
  DENSE_RANK() OVER (ORDER BY birth_date DESC,employee_id DESC) AS up_index
FROM employees
WHERE team = 'backend')

SELECT
  employee_id,
  full_name,
  team,
  birth_date
FROM index_backends
ORDER BY (CASE WHEN up_index<down_index THEN up_index*2-1 ELSE down_index*2 END);
