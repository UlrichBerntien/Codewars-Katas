SELECT
  src.first_name,
  src.last_name,
  EXTRACT(YEAR FROM AGE(src.date_of_birth ::timestamptz)) ::int AS age,
  CASE WHEN private THEN 'Hidden'
       WHEN src.email_address != '' THEN src.email_address
       ELSE 'None' END AS email_address
FROM
  (SELECT
    (XPATH( 'first_name/text()', row.xml))[1]              ::text AS first_name,
    (XPATH( 'last_name/text()', row.xml))[1]               ::text AS last_name,
    (XPATH( 'date_of_birth/text()', row.xml))[1]           ::text AS date_of_birth,
    (XPATH( 'private/text()', row.xml))[1]                 ::text = 'true' AS private,
    (XPATH( 'email_addresses/address/text()', row.xml))[1] ::text AS email_address
  FROM
    (SELECT
      unnest(xpath( '//data/user', data)) AS xml
    FROM users) AS row
  ) AS src
ORDER BY first_name, last_name;
