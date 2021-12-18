SELECT
    char_length(name) AS id,
    greatest(ceil(log(legs))::integer,1) AS name,
    greatest(ceil(log(arms))::integer,1) AS legs,
    char_length(characteristics) AS arms,
    greatest(ceil(log(id))::integer,1) AS characteristics
FROM monsters;