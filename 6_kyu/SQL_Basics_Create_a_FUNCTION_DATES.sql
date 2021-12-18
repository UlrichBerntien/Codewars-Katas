CREATE FUNCTION agecalculator ( birthday date )
    RETURNS double precision AS $$
        SELECT EXTRACT(YEARS FROM age(birthday))
    $$ LANGUAGE SQL;