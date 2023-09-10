-- Table of persons aged 30 to 50.
SELECT
  name,
  age
FROM persons
WHERE age BETWEEN 30 AND 50
ORDER BY age DESC;