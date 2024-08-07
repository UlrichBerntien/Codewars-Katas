WITH
-- Stock quantaties per subcategory
subcategory_quant AS
    (SELECT
        subcategory_id,
        SUM((deleted_at IS NULL OR deleted_at > NOW())::INT)::INT AS current,
        SUM((deleted_at IS NULL OR deleted_at > NOW()-INTERVAL'30 days')::INT)::INT AS ago_30_days
    FROM
        products
    GROUP BY
        subcategory_id)
    
-- Categories with decreased product stock
-- Decreased from 10 or more to below 10.
SELECT
    category_id,
    categories.name,
    SUM(current) AS current_quantity,
    SUM(ago_30_days) AS quantity_30_days_ago
FROM
    subcategories
LEFT JOIN
    subcategory_quant ON subcategory_quant.subcategory_id = subcategories.id
LEFT JOIN
    categories ON categories.id = subcategories.category_id
GROUP BY
    category_id, categories.name
HAVING
    SUM(ago_30_days) >= 10 AND SUM(current) < 10
ORDER BY
    category_id DESC;
