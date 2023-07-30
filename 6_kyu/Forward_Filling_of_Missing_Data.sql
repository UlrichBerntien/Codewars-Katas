-- Select sales data with NULL sales filled by sales of last day.
SELECT
  day,
  CASE WHEN sales IS NOT NULL THEN sales
       ELSE (SELECT sales FROM sales_data WHERE sales IS NOT NULL AND day < sd.day ORDER BY day DESC LIMIT 1) END
  AS filled_sales
FROM sales_data AS sd
ORDER BY day ASC;
