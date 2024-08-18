-- Current age distribution of employees.
WITH

age_grouped AS
    -- Number of employees in the defined age groups.
    (SELECT
      CASE
      WHEN date_of_birth > CURRENT_DATE - INTERVAL '18 years' THEN 1 --  0..17 years
      WHEN date_of_birth > CURRENT_DATE - INTERVAL '21 years' THEN 2 -- 18..20 years
      WHEN date_of_birth > CURRENT_DATE - INTERVAL '26 years' THEN 3 -- 21..25 years
      WHEN date_of_birth > CURRENT_DATE - INTERVAL '41 years' THEN 4 -- 26..40 years
                                                              ELSE 5 -- >40 yers
      END AS age,
      COUNT(*)
    FROM
      employees
    GROUP BY
      age)

SELECT
    -- Percentual numbers of employees in the defined age groups.
    CASE
    WHEN age = 1 THEN '0-17'
    WHEN age = 2 THEN '18-20'
    WHEN age = 3 THEN '21-25'
    WHEN age = 4 THEN '26-40'
    WHEN age = 5 THEN '>40'
    END AS age_interval,
    ROUND(100.0*COALESCE(count,0)/(SELECT COUNT(*) FROM employees),2) AS percent
FROM
    -- At least these 3 age groupss must be listed in the table.
    (VALUES (2),(4),(5)) AS r(age)
LEFT JOIN
    age_grouped USING (age)
ORDER BY
    age;
