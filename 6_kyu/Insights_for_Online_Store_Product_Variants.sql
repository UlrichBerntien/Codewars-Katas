WITH
    -- Count product variants in stock.
    in_stock AS
    (SELECT
        product_id,
        COUNT(*) AS in_stock_variants
    FROM
        (SELECT DISTINCT product_id, color_id, size_id FROM product_variants WHERE in_stock) AS uq
    GROUP BY
        product_id),

    -- Count total product variants.
    total AS
    (SELECT
        product_id,
        COUNT(*) AS total_unique_variants
    FROM
        (SELECT DISTINCT product_id, color_id, size_id FROM product_variants) AS uq
    GROUP BY
        product_id)

SELECT
    product_id,
    COALESCE(in_stock_variants,0) AS in_stock_variants,
    total_unique_variants
FROM
    total
LEFT JOIN
    in_stock USING (product_id)
ORDER BY
    product_id ASC;
