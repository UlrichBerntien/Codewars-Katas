-- given a table 'dalmatians' with column 'n' (int)
-- return column 'n' and result column 'res' (text)
-- sort results by column 'n' ascending

SELECT
  n,
  CASE
    WHEN n = 101 THEN '101 DALMATIANS!!!'
    WHEN n <= 10 THEN 'Hardly any'
    WHEN n <= 50 THEN 'More than a handful!'
    ELSE 'Woah that''s a lot of dogs!' END
  AS res
FROM dalmatians
ORDER BY n ASC;