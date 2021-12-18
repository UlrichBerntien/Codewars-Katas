WITH
  top_pair AS (
    SELECT
      COUNT(fa1.film_id) AS film_count,
      fa1.actor_id AS first_actor_id,
      fa2.actor_id AS second_actor_id
    FROM film_actor AS fa1
    INNER JOIN film_actor AS fa2
    ON fa1.film_id = fa2.film_id
    WHERE fa1.actor_id < fa2.actor_id
    GROUP BY fa1.actor_id, fa2.actor_id
    ORDER BY film_count DESC
    LIMIT 1
  ),
  result_ids AS (
    SELECT
      top.first_actor_id as first_actor_id,
      top.second_actor_id as second_actor_id,
      fa1.film_id AS film_id
    FROM
      film_actor AS fa1,
      top_pair as top
    WHERE
      fa1.actor_id = top.first_actor_id
      AND EXISTS (SELECT * FROM film_actor AS fa2
                  WHERE fa2.film_id = fa1.film_id AND fa2.actor_id = top.second_actor_id )
  )
SELECT
  concat(a1.first_name, ' ', a1.last_name) AS first_actor,
  concat(a2.first_name, ' ', a2.last_name) AS second_actor,
  f1.title AS title
FROM
  result_ids,
  actor AS a1,
  actor AS a2,
  film AS f1
WHERE
  a1.actor_id = result_ids.first_actor_id
  AND a2.actor_id = result_ids.second_actor_id
  AND f1.film_id = result_ids.film_id;