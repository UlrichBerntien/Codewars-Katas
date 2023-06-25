-- Generates tables
--    s = string to repeat
--    n = n number of repeations
--    res = string s repeated n times
SELECT
  s,
  n,
  repeat(s,n) AS res
FROM repeatstr
