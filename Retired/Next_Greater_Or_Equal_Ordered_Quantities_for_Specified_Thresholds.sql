-- Next Greater Or Equal Ordered Quantities for Specified Thresholds
SELECT
DISTINCT ON (iv.order_id, iv.threshold_quantity)
    iv.order_id,
    iv.threshold_quantity,
    po.quantity AS next_ge_quantity,
    po.product_name    
FROM inventory_thresholds AS iv
LEFT JOIN product_orders AS po ON po.order_id = iv.order_id AND po.quantity >= iv.threshold_quantity
ORDER BY
    iv.order_id ASC,
    iv.threshold_quantity ASC,
    next_ge_quantity ASC; -- select one row by smallest next_ge_quantity
