-- Table of customers by date.
-- Count is the count of distinct customer names in the last 2 days with same ID. 
SELECT
    c.date,
    c.customer_id,
    c.name,
    (   SELECT COUNT(DISTINCT name)
        FROM customers
        WHERE customer_id = c.customer_id AND date BETWEEN c.date-INTERVAL '2 day' AND c.date
     ) AS count
FROM
    customers AS c
ORDER BY
    c.date ASC,
    c.customer_id DESC,
    c.name ASC;
