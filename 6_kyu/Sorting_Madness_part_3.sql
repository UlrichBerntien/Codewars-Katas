-- Table sorted by customer_id and alternated by is_return.
SELECT
    customer_id,
    is_return
FROM orders
ORDER BY
    customer_id ASC,
    ROW_NUMBER() OVER (PARTITION BY customer_id,is_return) ASC,
    is_return DESC;
