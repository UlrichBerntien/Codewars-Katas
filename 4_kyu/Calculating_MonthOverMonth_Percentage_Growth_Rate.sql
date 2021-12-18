WITH
posts_by_month AS (
  SELECT
    date_trunc('month',created_at)::DATE AS date,
    COUNT(*) AS count
  FROM posts
  GROUP BY date
  ORDER BY date
),
posts_delta_month AS (
  SELECT
    *,
    LAG(count) OVER () AS last_count
  FROM posts_by_month
)
SELECT
  date,
  count,
  CASE WHEN last_count IS NULL OR last_count < 1 THEN trim(NULL)
       ELSE to_char(100.0*(count-last_count)/last_count,'FM99990D0%') END AS percent_growth
FROM posts_delta_month
