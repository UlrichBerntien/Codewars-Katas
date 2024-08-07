-- Count job applications based on status
SELECT
    *
FROM (VALUES
    ('Rejected', (SELECT COUNT(*) FROM applications WHERE application_status <= 5)),
    ('Approved', (SELECT COUNT(*) FROM applications WHERE application_status > 5))
) AS tbl(status_group, application_num);
