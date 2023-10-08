WITH

RECURSIVE factorials AS
    (SELECT
        1 AS n,
        1::DECIMAL AS result
    UNION
    SELECT
        n+1 AS n,
        result*(n+1) AS result
    FROM factorials
    WHERE n < 10)

-- Table of factorials 1..10
SELECT
    n,
    result
FROM factorials;
