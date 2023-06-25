-- Generates table
--    x = string
--    res = string x without any space character
SELECT
  x,
  translate(x,' ','') as res
FROM nospace
