SELECT
  name,
  greeting,
  substring( greeting from '#(\d+)' ) AS user_id
FROM greetings;