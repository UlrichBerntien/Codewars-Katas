CREATE TEMP TABLE IF NOT EXISTS
result ('row number' INTEGER PRIMARY KEY ASC,
        id INTEGER,
        name TEXT );

INSERT INTO result
SELECT NULL AS 'row number', id, name
FROM people
ORDER BY name;

SELECT * FROM result ORDER BY 'row number';