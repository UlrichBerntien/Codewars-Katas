CREATE EXTENSION tablefunc;

SELECT
  products.name,
  good,
  ok,
  bad
FROM crosstab('
    SELECT
      product_id AS rowid,
      detail AS atribute,
      COUNT(detail) AS value
    FROM details
    GROUP BY product_id, detail
    ORDER BY product_id, detail')
AS ct(rowid int, bad bigint, good bigint, ok bigint)
JOIN products ON products.id = rowid
ORDER BY products.name;
