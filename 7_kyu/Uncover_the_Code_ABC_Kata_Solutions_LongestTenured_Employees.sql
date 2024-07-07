-- Uncover the Code
SELECT
    -- sum of the ASCII number of last name initial character.
    sum(ascii(last_name_initial)) AS hidden_code
FROM
    (SELECT
        substring(name,'\m(\S)\S*$') AS last_name_initial
    FROM
        employees
    WHERE
        left_date IS NULL
    ORDER BY
        joined_date ASC
    LIMIT
        5) AS five_oldest_current;