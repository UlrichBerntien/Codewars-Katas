--# write your SQL statement here: 
-- you are given a table 'squares' with column 'n' (numer of cubes).
-- return a table with:
--   this column and your result in a column named 'res'

-- Generates table
--    n = given number of cuts, n+1 is the number of cubes per orientation
--    res = number of outside cubes 
SELECT
  n,
  CASE WHEN n > 0 THEN 6*n*n+2 ELSE 1 END AS res
FROM squares;
