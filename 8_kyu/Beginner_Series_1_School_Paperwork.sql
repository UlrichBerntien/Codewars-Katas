-- Generates table:
--    n = given number persons
--    m = given number of pages
--    res = calculated number of total pages n*m
SELECT
  n,
  m,
  CASE WHEN n>0 AND m>0 THEN n*m ELSE 0 END AS res
FROM paperwork;
