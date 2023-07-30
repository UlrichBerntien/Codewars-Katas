-- Table of the last dealer logins.
-- Marks all dealer who have logged in during the last 60 days as active.
-- LIMITATION: Works with the local time zone of the database.
SELECT
    deal_id,
    deal_name,
    last_login_ago <= INTERVAL '90 DAYS' AS is_active,
    EXTRACT(DAYS FROM last_login_ago)||' days and '||EXTRACT(HOUR FROM last_login_ago)||' hours ago' AS last_login
FROM
    (SELECT
        deal_id,
        LOCALTIMESTAMP - MAX(occurred_at) AS last_login_ago
    FROM deal_login_fact
    GROUP BY deal_id) AS last_logins
JOIN deals USING (deal_id)
ORDER BY deal_id DESC;
