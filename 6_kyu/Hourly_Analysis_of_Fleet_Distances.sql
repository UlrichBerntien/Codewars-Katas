WITH

-- Total distance travelled in each hour (km).
-- Limited to the day of interest.
-- Hours in which no activity takes place are not in the table.
km_each_hour AS
    (SELECT
        DATE_TRUNC('hour',time) AS time_from,
        SUM(km) AS km
    FROM cars
    WHERE time >= TO_TIMESTAMP('2023-07-16 08:00:00','YYYY-MM-DD HH24:MI:SS')
      AND time < TO_TIMESTAMP('2023-07-16 18:00:00','YYYY-MM-DD HH24:MI:SS')
    GROUP BY time_from
    ORDER BY time_from)

-- Distance travelled in each hour (km) and total distance.
SELECT
    time_from::TEXT,
    (time_from + INTERVAL '1 hour')::TEXT AS time_to,
    km,
    'Total of ' ||
      EXTRACT(hour FROM time_from - (SELECT MIN(time_from) FROM km_each_hour))+1 ||
      ' hour(s): ' ||
      SUM(km) OVER (ORDER BY time_from) AS total_km
FROM km_each_hour
ORDER BY time_from;
