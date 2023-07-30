-- Session distribution over 5sec length intervalls.
SELECT
  interval*5||'-'||4+interval*5 AS bucket,
  count
FROM
    (SELECT
        length_seconds::INT/5 AS interval,
        COUNT(session_id) AS count
    FROM sessions
    GROUP BY interval) AS buckets
ORDER BY interval;
