CREATE FUNCTION increment( IN age INTEGER )
    RETURNS INTEGER
AS 'SELECT age + 1;'
LANGUAGE 'sql';