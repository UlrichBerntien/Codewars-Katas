-- Selects a list of internal and admin users.
-- Exclude are user with non of this roles or both.
SELECT
    username,
    internal,
    admin
FROM
    (SELECT
        username,
        BOOL_OR(role = 'internal') AS internal,
        BOOL_OR(role = 'admin') AS admin
    FROM user_roles
    GROUP BY username) AS sub
WHERE internal <> admin
ORDER BY username ASC;
