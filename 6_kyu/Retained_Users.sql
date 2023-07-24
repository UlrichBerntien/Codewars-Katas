-- Counts all retained users.
-- A user is "retained" if they have logged in this month and the previous month.
WITH
logins_in_month AS
(SELECT user_id, date_trunc('month',date) AS month FROM logins)

SELECT
  to_char(last.month,'FMMonth, YYYY') AS month,
  COUNT(DISTINCT last.user_id) AS retained_users
FROM logins_in_month AS last
INNER JOIN logins_in_month before
        ON last.user_id = before.user_id
       AND last.month - interval '1 month' = before.month
GROUP BY last.month
ORDER BY last.month ASC;
