-- Generates table
--    s = given string
--    res = string s without any exclamation mark '!' character.
SELECT
  s,
  translate(s,'!','') AS res
FROM removeexclamationmarks;
