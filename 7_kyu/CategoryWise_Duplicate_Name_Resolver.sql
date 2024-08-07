-- Category-wise renamed name duplicates.
SELECT
    item_id,
    category_id,
    CASE
      WHEN sub_id > 1 THEN item_name_primary||'_'||sub_id
      ELSE item_name_primary
    END AS item_name
FROM
  (SELECT
    item_id,
    category_id,
    item_name AS item_name_primary,
    RANK() OVER (PARTITION BY category_id,lower(item_name) ORDER BY item_id) AS sub_id
  FROM
    items) AS duplicates_numbered
ORDER BY
  category_id,
  item_id,
  item_name;
