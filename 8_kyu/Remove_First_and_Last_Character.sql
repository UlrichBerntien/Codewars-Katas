-- Generate table:
--    s = input string
--    res = input string s without first and last character
SELECT
  s,
  CASE WHEN length(s) > 2
  THEN substring(s FROM 2 FOR length(s)-2)
  ELSE '' END AS res
FROM removechar;
