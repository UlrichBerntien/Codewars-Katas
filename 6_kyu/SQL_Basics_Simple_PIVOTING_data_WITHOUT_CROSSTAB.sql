SELECT
  name,
  (row_to_json(c_good)->>'count')::int AS good,
  (row_to_json(c_ok  )->>'count')::int AS ok,
  (row_to_json(c_bad )->>'count')::int AS bad
FROM products AS pr,
LATERAL (SELECT count(*) FROM details WHERE pr.id = product_id AND detail ='good') AS c_good,
LATERAL (SELECT count(*) FROM details WHERE pr.id = product_id AND detail ='ok') AS c_ok,
LATERAL (SELECT count(*) FROM details WHERE pr.id = product_id AND detail ='bad') AS c_bad
ORDER BY name;