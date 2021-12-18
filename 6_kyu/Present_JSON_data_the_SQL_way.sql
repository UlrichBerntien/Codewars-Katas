SELECT
  data->>'first_name' AS first_name,
  data->>'last_name' AS last_name,
  extract(year FROM age(date(data->>'date_of_birth')))::int AS age,
  CASE WHEN data->>'private' = 'true' THEN 'Hidden'
       WHEN json_array_length(data->'email_addresses') > 0 THEN data#>>'{email_addresses,0}'
       ELSE 'None' END AS email_address
FROM users
ORDER BY first_name, last_name;