WITH 

-- Sign ups counted per day.
daily_signups AS
    (SELECT
        registered_at::DATE AS date,
        COUNT(id) AS sign_ups
    FROM users
    GROUP BY date),

-- Full table of sign ups per day, also 0 sign ups per day included.
full_daily_signups AS
    (SELECT
        generate_series::DATE AS date,
        COALESCE(sign_ups,0) AS sign_ups
    FROM generate_series( (SELECT MIN(date) FROM daily_signups), (SELECT MAX(date) FROM daily_signups), INTERVAL '1 day' )
    LEFT JOIN daily_signups ON date = generate_series)

-- Daily registrations and 8-day running average.
SELECT
    date,
    sign_ups,
    ROUND(AVG(sign_ups) OVER (ROWS BETWEEN 7 PRECEDING AND CURRENT ROW),2) AS avg_signups
FROM full_daily_signups 
ORDER BY date ASC;
