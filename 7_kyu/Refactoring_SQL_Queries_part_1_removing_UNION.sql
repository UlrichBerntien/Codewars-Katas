-- Table of city names starting by AEIO or U.
SELECT DISTINCT city_name
FROM stations
WHERE LEFT(city_name,1) IN ('A','E','I','O','U')
ORDER BY city_name ASC;