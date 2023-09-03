WITH

-- First price per product
first_bids AS
    (SELECT DISTINCT ON(product_id)
        product_id,
        price
    FROM bids
    ORDER BY product_id, date),
 
 -- Table of the bids with sliding maximum per product
 sliding_max AS
    (SELECT
        product_id,
        date,
        price,
        MAX(price) OVER (PARTITION BY product_id ORDER BY date) AS max_price
    FROM bids),

-- Table prepared to select ony raising bids.
selected_bids AS
    (SELECT
        product_id,
        date,
        price,
        COALESCE(price > LAG(max_price) OVER (PARTITION BY product_id),true) AS keep
    FROM sliding_max)

-- Raising bids per product.
--    bids not raising the price are excluded
--    times_higher is the factor from first bid to last bid
SELECT
    product_id,
    ROW_NUMBER() OVER (PARTITION BY product_id) bid_number,
    date::TEXT,
    price,
    CASE WHEN LEAD(price) OVER (PARTITION BY product_id) IS NULL
         THEN ROUND(price::NUMERIC/(SELECT price FROM first_bids WHERE product_id=selected_bids.product_id),2) END AS times_higher
FROM selected_bids
WHERE keep
ORDER BY product_id, date;
