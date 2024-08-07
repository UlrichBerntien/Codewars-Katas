-- given a table 'score' with column 's' (text)
-- return column 's' and your result in a column named 'res' (boolean)
-- sorted by column 's' ascending
WITH

-- Select the first ball.
first_step AS
    (SELECT
      s,
      SUBSTRING(s, '^[nesw]*([WYR])') AS first
    FROM
      score),

-- Select the second ball (the second ball must have a different colour).
second_step AS
    (SELECT
      s,
      first,
      SUBSTRING(s, '^[nesw'||first||']*([^news'||first||'])') AS second
    FROM first_step),

-- Select the count of cushions before the second ball.
-- Hitting the fist ball more than once is ok but not counted.
third_step AS
    (SELECT
      s,
      first,
      second,
      LENGTH(REPLACE(SUBSTRING(s, '^([nesw'||first||']*)'||second),first,'')) AS count
    FROM second_step)

-- Select the result.
-- Ok if two balls are hit and at least 3 cushions before the second ball.
SELECT
  s,
  COALESCE(first <> second AND count >= 3,false) AS res
FROM
  third_step
ORDER BY
  s ASC;
