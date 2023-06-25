-- Generates table
--      n = number
--      res = sum of all integers 1,2,3,..,n
SELECT
  n,
  (n*(n+1))/2 as res -- Gauss formula
FROM kata
