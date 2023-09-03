WITH

-- Numbered list of week days in July, August, September.
-- Each day in this list becomes one "developer of the day".
day_list AS
    (SELECT
        ROW_NUMBER() OVER (ORDER BY date)-1 AS day_id,
        date::DATE,
        TO_CHAR(date,'Day') AS day_of_week
    FROM GENERATE_SERIES(DATE '2023-07-01', DATE '2023-09-30', INTERVAL '1 day') AS date
    WHERE EXTRACT('DOW' FROM date) BETWEEN 1 AND 5),

-- Numbered list of employees in the backend team.
-- The numbering is orderd by birth date, the order of the "develope of the day".
employee_list AS
    (SELECT
        ROW_NUMBER() OVER (ORDER BY birth_date DESC)-1 AS emp_id,
        employee_id,
        full_name
    FROM employees
    WHERE team = 'backend')

-- List of Developer of the day.
SELECT
    date,
    day_of_week,
    employee_id,
    full_name
FROM day_list
JOIN employee_list ON emp_id = day_id % (SELECT COUNT(*) FROM employee_list)
ORDER BY day_id;
