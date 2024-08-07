-- Timely Product Prices and Customer Reviews at the Point of Sale
SELECT
  sale_time::TEXT,
  product_id,
  price,
  ( SELECT review_rating
    FROM customer_reviews AS c
    WHERE c.product_id = first.product_id AND review_time <= first.sale_time
    ORDER BY review_time DESC
    LIMIT 1
    ) AS review_rating
FROM
  ( SELECT
      id,
      sale_time,
      product_id,
      ( SELECT price
        FROM product_prices AS p
        WHERE p.product_id = sales.product_id AND price_time <= sale_time
        ORDER BY price_time DESC
        LIMIT 1
      ) AS price
    FROM
      sales
    ) AS first
WHERE
  price IS NOT NULL
ORDER BY
  sale_time DESC,
  first.id DESC;
