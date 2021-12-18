WITH
  event_list AS 
  (SELECT
    event_time, id, change
  FROM (SELECT entry_time AS event_time, id, 1 AS change FROM visits) AS com
  UNION (SELECT exit_time AS event_time, id, -1 AS change FROM visits)
  ORDER BY event_time, id)
SELECT
  event_time AS when_happened,
  sum(change) OVER (ORDER BY event_time, id) AS visits_count
FROM event_list
GROUP BY event_time, id, change
ORDER BY visits_count DESC, event_time
LIMIT 1;