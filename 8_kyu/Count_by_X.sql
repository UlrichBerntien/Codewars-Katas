-- given table 'counter' with columns 'x' (int) and 'n' (int)
-- return columns 'x', 'n' and result column named 'res' (array)
-- ordered by column 'x' ascending, then by 'n' ascending
SELECT
  x,
  n,
  (SELECT array_agg(i) FROM (SELECT generate_series(x,n*x,x) AS i) AS numbers) AS res
FROM
  counter
ORDER BY
  x ASC, n ASC;