WITH

-- Table of all users logged in in the month.
user_in_month AS
(SELECT DISTINCT
    user_id,
    DATE_TRUNC('month', date) AS month
FROM logins),

-- Table of first login month per user.
user_first_month AS
(SELECT
    user_id,
    MIN(month) AS first_month
FROM user_in_month
GROUP BY user_id)

-- Table of number reactivated users per month.
-- As user is reactivated in the users was at least lasst month not logged in.
SELECT
    TO_CHAR(r.month, 'FMMonth, YYYY') AS month,
    COUNT(r.user_id) AS reactivated_users
FROM user_in_month AS r
JOIN user_first_month AS f ON f.user_id = r.user_id AND f.first_month < r.month
WHERE NOT EXISTS(SELECT 1 FROM user_in_month WHERE user_id = r.user_id AND month = r.month - INTERVAL '1 month')
GROUP BY r.month
ORDER BY r.month;
