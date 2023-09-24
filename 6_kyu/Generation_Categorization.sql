WITH

-- Table of generations nick names.
-- first .. last is the range of the birthday year (including first and last).
generations AS
  (SELECT *
  FROM
    (VALUES
     (1997, 2012, 'Generation Z'),
     (1981, 1996, 'Millennials'),
     (1965, 1980, 'Generation X'),
     (1946, 1964, 'Baby Boomers'),
     (1928, 1945, 'Silent Generation'),
     (1800, 1927, 'Greatest Generation')
    ) AS val(first,last,name))

-- Table of users with genration name.
SELECT
    u.id,
    u.name,
    u.birthdate,
    g.name AS generation
FROM users AS u
LEFT JOIN generations AS g ON EXTRACT(YEAR FROM u.birthdate) BETWEEN g.first AND g.last
ORDER BY u.id;
