WITH
    work AS(
    SELECT
        department.id AS department_id,
        department.name AS department_name,
        timesheet.id AS timesheet_id,
        date_trunc('day',timesheet.login)::Date AS day,
        EXTRACT(epoch FROM (timesheet.logout-timesheet.login))/3600 AS hours
    FROM timesheet JOIN department ON timesheet.department_id = department.id)
SELECT
    day,
    department_name,
    SUM(hours) AS total_hours
FROM work
GROUP BY day, department_name
ORDER BY day, department_name;