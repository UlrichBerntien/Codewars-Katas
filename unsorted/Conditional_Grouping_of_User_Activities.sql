-- Table of total user activity.
--    Sums the activity count for each user.
--    Sums the activity count for all 'User[decimal digits]' in group others.
SELECT
    username,
    SUM(activity_count) as total_activity
FROM
    (SELECT
        CASE
            WHEN username SIMILAR TO 'User\d+' THEN 'GROUP_OTHERS'
            ELSE username
        END AS username,
        CASE WHEN username SIMILAR TO 'User\d+' THEN INT8 '1' ELSE INT8 '2' END AS group_id,
        activity_count
    FROM user_activity
    WHERE activity_count BETWEEN 1 AND 2000) AS sub
GROUP BY group_id, username
ORDER BY group_id, username;
