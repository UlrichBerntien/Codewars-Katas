-- Returns always 10 rows 
SELECT *
FROM (
  (SELECT a,b FROM sample_table ORDER BY a LIMIT 10)
  UNION ALL
  (VALUES (0,'-'),(0,'-'),(0,'-'),(0,'-'),(0,'-'),(0,'-'),(0,'-'),(0,'-'),(0,'-'),(0,'-'))
) AS s
LIMIT 10;
