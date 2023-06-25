-- Generates table
--    month = given month (1,2,...12) in the year
--    res = quarter (1,2,3,4) of the month in the year
SELECT
  month,
  (month+2)/3 AS res
FROM quarterof;
