-- Finds the TOP 5 countries according population increase between 2000 and 2022.
WITH
population_2000 AS (
  SELECT country, AVG(population) AS pop_2000
  FROM world_population
  WHERE year = 2000
  GROUP BY country
),
 population_2020 AS (
  SELECT country, AVG(population) AS pop_2020
  FROM world_population
  WHERE year = 2020
  GROUP BY country
)
SELECT
  country,
  ROUND((p2020.pop_2020-p2000.pop_2000)/1e6,2) || ' M' AS population_increase
FROM population_2000 AS p2000
INNER JOIN population_2020 AS p2020 USING (country)
ORDER BY p2020.pop_2020-p2000.pop_2000 DESC
LIMIT 5;
