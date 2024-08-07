-- Splits product features into single rows.
SELECT
    product_id,
    regexp_split_to_table(features,'') AS feature
FROM
    products
ORDER BY
    product_id ASC;