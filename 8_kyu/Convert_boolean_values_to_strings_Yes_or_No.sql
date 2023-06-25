-- Generates table
--    bool = value
--    res = string 'Yes' if bool is true else 'No'
SELECT
  bool,
  CASE WHEN bool THEN 'Yes' ELSE 'No' END AS res
FROM booltoword