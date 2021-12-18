SELECT
    name,
    weight,
    price,
    round((price*1000/weight)::numeric,2)::double precision AS price_per_kg
FROM
    products
ORDER BY
    price_per_kg ASC, name ASC;