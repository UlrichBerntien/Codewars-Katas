-- Count ALL products of each producer:
SELECT
   count(*) AS unique_products,
   producer AS producer
FROM
    products
GROUP BY
    producer
ORDER BY
    unique_products DESC, producer ASC;

/*
-- Count ONLY unique products of each producer:
WITH
    unique_products AS (
    SELECT name
        FROM (SELECT name, count(*) AS count FROM products GROUP BY name) AS nc
        WHERE count = 1
    )    
SELECT
   count(*) AS unique_products,
   p.producer AS producer
FROM
    products AS p
NATURAL JOIN    
    unique_products
GROUP BY
    p.producer
ORDER BY
    unique_products DESC, producer ASC;
*/