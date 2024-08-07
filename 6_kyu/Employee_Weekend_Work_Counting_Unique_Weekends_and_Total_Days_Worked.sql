-- Count Unique Weekends and Total Days at Weekends Worked
SELECT
    employee_id,
    COUNT(DISTINCT week) AS weekends_worked,
    COUNT(*) AS total_weekend_days_worked
FROM
    (SELECT DISTINCT
        employee_id,
        EXTRACT(week FROM attendance_date)*10000+EXTRACT(isoyear FROM attendance_date) AS week,
        EXTRACT(isodow FROM attendance_date) AS isodow
    FROM
        employee_attendance
    WHERE
        EXTRACT(year FROM attendance_date) = 2023
        AND EXTRACT(isodow FROM attendance_date) >= 6) AS sq
GROUP BY
    employee_id
ORDER BY
    weekends_worked DESC,
    total_weekend_days_worked DESC,
    employee_id DESC;
