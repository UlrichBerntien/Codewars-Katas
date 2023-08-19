-- Shipment batches numbered by status code.
-- All order with status_code 4 in batch 1,
-- all other orders in the following batches by order id.
SELECT
    order_id,
    product_name,
    status_code,
    CASE WHEN group_id > 0
         THEN ROW_NUMBER() OVER (PARTITION BY group_id)
         ELSE 0
         END AS shipment_batch_number
FROM
    (SELECT
        order_id,
        product_name,
        status_code,
        COUNT(*) FILTER (WHERE status_code = 4) OVER (ORDER BY order_id) AS group_id
    FROM order_status) AS sub
ORDER BY order_id;
