WITH

-- Maximum quantity sold in one transaction per product and store.
max_sale_transaction AS
    (SELECT
        store_id,
        product_id,
        MAX(quantity) AS max_quantity
    FROM sales
    GROUP BY store_id, product_id),

-- Maximum quantity sold in one transaction per product and store.
-- with date of maximum transaction (first transaction, if max does not distinct).
max_sale_transaction_dated AS
    (SELECT
        mx.store_id,
        mx.product_id,
        MIN(sa.transaction_date) AS transaction_date,
        MAX(mx.max_quantity) AS max_quantity
    FROM max_sale_transaction AS mx
    JOIN sales AS sa ON sa.store_id = mx.store_id AND sa.product_id = mx.product_id AND sa.quantity = mx.max_quantity
    GROUP BY mx.store_id, mx.product_id)

-- Maximum quantity sold in one transaction per product and store.
-- with date of maximum transaction (first transaction, if max does not distinct)
-- and sum of all transaction at this date of the product at the store
SELECT DISTINCT ON (store_id, product_id)
    store_id,
    product_id,
    transaction_date,
    max_quantity,
    SUM(quantity) OVER (PARTITION BY store_id, product_id, transaction_date) AS total_quantity_on_max_day
FROM max_sale_transaction_dated
JOIN sales USING( store_id, product_id, transaction_date)
ORDER BY store_id, product_id;
