WITH
    departments_ext AS (
    SELECT
        department_id,
        department_name,
        1 + pctIncrease(department_id) AS salary_factor
    FROM
        departments
    )
SELECT
    e.employee_id,
    e.first_name,
    e.last_name,
    d.department_name,
    e.salary AS old_salary,
    e.salary * d.salary_factor AS new_salary
FROM
    employees e,
    departments_ext d
WHERE
    e.department_id = d.department_id
ORDER BY
    e.employee_id;