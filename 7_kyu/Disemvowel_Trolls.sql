-- Generates table
--    str = strings
--    res = string str without vowels.
SELECT
  str,
  translate(str,'aeiouAEIOU','') AS res
FROM disemvowel
