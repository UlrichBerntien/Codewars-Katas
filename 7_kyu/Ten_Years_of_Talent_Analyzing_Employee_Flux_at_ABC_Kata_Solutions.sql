-- How many employees joined and left ABC Kata Solutions each year, from 2014 through 2023?

WITH
    -- Table of the selected year
    year_table AS
    (SELECT
        generate_series(2014,2023) AS year
    ),
    -- Table of #employees left in the years
    left_employees AS
    (SELECT
        year,
        COUNT(*) AS count
    FROM  
        (SELECT id, EXTRACT(YEAR FROM left_date) AS year FROM employees) AS lft
    WHERE
        year BETWEEN 2014 AND 2023
    GROUP BY
        year),
    -- Table of #employees joined in the years
    joined_employees AS
    (SELECT
        year,
        COUNT(*) AS count
    FROM  
        (SELECT id, EXTRACT(YEAR FROM joined_date) AS year FROM employees) AS joined
    WHERE
        year BETWEEN 2014 AND 2023
    GROUP BY
        year)

SELECT
    year_table.year AS year,
    COALESCE(left_employees.count,0) AS left_quantity,
    COALESCE(joined_employees.count,0) AS joined_quantity
FROM
    year_table
    LEFT JOIN left_employees USING (YEAR)
    LEFT JOIN joined_employees USING (YEAR)
ORDER BY
    year ASC;
