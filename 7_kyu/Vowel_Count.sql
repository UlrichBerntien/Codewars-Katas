-- Result table:
--    str = string
--    res = number of vowels in the string str
SELECT
  str,
  char_length(str)-char_length(translate(str,'aeiouAEIOU','')) as res
FROM getcount
