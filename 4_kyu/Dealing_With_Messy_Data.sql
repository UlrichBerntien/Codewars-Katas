WITH
cst AS (
  SELECT
    upper(first_name)||' '||upper(last_name) AS upper_name1,
    upper(last_name)||' '||upper(first_name) AS upper_name2,
    id,
    first_name,
    last_name,
    credit_limit
  FROM customers ),

prs AS (
  SELECT
    upper(regexp_replace(full_name,'[, ]+',' ')) AS upper_name,
    credit_limit
  FROM prospects )

SELECT
  cst.first_name,
  cst.last_name,
  max(cst.credit_limit) AS old_limit,
  max(prs.credit_limit) AS new_limit
FROM cst
JOIN prs
ON cst.upper_name1 = prs.upper_name OR cst.upper_name2 = prs.upper_name
GROUP BY cst.id, cst.first_name, cst.last_name
HAVING max(cst.credit_limit) < max(prs.credit_limit)
ORDER BY cst.first_name, cst.last_name
