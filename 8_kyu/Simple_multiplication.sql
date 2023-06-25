-- Generates table:
--    number = the input number
--    res = the number*8 if number is even else number*9.
SELECT
  number,
  number*(8+number%2) AS res
FROM multiplication;
