WITH

-- Sum over amount for all sales.
-- Needed to calculate the %Sale
total_amount AS
  (SELECT
      SUM(amount)
  FROM sales),

-- Add a 30 minutes interval to all single sales.
half_hour_sales AS
  (SELECT
      -- the half houres of the day 0 = 00:00-00:29, 1=00:30-00:59, ...
      EXTRACT(HOUR FROM timestamp)*2 + EXTRACT(MINUTE FROM timestamp)::INT/30 AS halfs,
      amount
  FROM
      sales)

-- List all 30 minutes intervals (10:00 - 22:00).
-- Include count, sale amount and relative sale amount in all intervals.
SELECT
    TO_CHAR(interval '30 minute' * halfs,'HH12:MI AM')||'-'||TO_CHAR(interval '30 minute' * (halfs+1),'HH12:MI AM')  AS "Time",
    COALESCE(COUNT(amount),0) AS "Cnt",
    COALESCE(SUM(amount),0)::MONEY AS "Sales",
    ROUND(COALESCE(SUM(amount),0)/(SELECT * FROM total_amount)*100,2) AS "%Sales"
FROM GENERATE_SERIES(10*2,22*2) AS halfs
LEFT JOIN half_hour_sales USING(halfs)
GROUP BY halfs
ORDER BY halfs ASC;
