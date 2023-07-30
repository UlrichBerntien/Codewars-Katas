-- Enumerate consecutive runs.
-- Runs with same value and consecutive id have same run_id.
SELECT
  id,
  value,
  SUM(run_id_step) OVER (ORDER BY id ASC, value ASC) AS run_id
FROM
( SELECT
    id,
    value,
    CASE WHEN id = 1+LAG(id) OVER () AND value = LAG(value) OVER () THEN 0
         ELSE 1 END AS run_id_step
  FROM entries
  ORDER BY id ASC, value ASC) AS sub;