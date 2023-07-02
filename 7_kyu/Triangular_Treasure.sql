-- Generate table
--      n = given number n
--      res = sum 1+2+...+n
-- Uses Gauss formula
SELECT
  n,
  (greatest(0,n::bigint)*(n::bigint+1))/2 AS res
FROM triangular;
