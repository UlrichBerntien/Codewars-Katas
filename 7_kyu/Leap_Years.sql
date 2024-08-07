-- The "is leap year" condition using SQL.
SELECT
  year,
  (year % 4 = 0) AND (year % 400 = 0 OR year % 100 <> 0) AS is_leap
FROM
  years
ORDER BY
  year ASC;