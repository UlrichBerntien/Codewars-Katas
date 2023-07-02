-- Generates table of youngest employee in each team.
-- LIMITATION: Grou_ping is not allowed.
--             Only one youngest employee per team exists
SELECT
  employee_id,
  full_name,
  team,
  birth_date
FROM employees AS tabi
WHERE birth_date IN
  (SELECT birth_date FROM employees WHERE team=tabi.team ORDER BY birth_date DESC LIMIT 1)
ORDER BY team ASC
