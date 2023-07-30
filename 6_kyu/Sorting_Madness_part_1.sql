-- Sorted order table.
--   First all customer with at least one type 'S' order
--   Second all other customer.
--   Customers alphabetical sorted in each group.
--   type 'S' orders first for each customer.
--   other orders sorted by order id.
SELECT
  order_id,
  customer,
  order_type
FROM orders
ORDER BY
  bool_or(order_type = 'S') OVER (PARTITION BY customer) ASC,
  customer ASC,
  order_type = 'S' ASC,
  order_id ASC;
