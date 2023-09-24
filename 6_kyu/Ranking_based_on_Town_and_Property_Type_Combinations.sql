-- Customers listed with ranking.
--    Ranking on town name and property_type name.
SELECT
    rank_order,
    town,
    property_type,
    customer_id,
    order_id
FROM
    (SELECT
        RANK() OVER (ORDER BY town, property_type) AS rank_order,
        town,
        property_type,
        customer_id
    FROM customer_preferences) AS sub
NATURAL LEFT JOIN order_info
ORDER BY rank_order, customer_id, order_id;
