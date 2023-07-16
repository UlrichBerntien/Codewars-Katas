-- Counts the users in each class.
-- Counts a user only in the upper class (class b > class a) if a user is in more than one class.
SELECT
  upper_class AS class,
  COUNT(*) AS count
FROM
  (SELECT
    user_id,
    MAX(class) AS upper_class
  FROM users
  GROUP BY user_id) AS user_summary
GROUP BY upper_class
ORDER BY class;
