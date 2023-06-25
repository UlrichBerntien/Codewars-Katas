-- Creates a table
--    str = the specified string
--    res = True iff the string str is a palindrome.
-- The check is not case-sensitive, only letters and digits are compared.
SELECT
  str,
  str_reduced = reverse(str_reduced) AS res
FROM (SELECT
  str,
  regexp_replace(lower(str),'[^\w]','') AS str_reduced
FROM ispalindrome) AS tab;
