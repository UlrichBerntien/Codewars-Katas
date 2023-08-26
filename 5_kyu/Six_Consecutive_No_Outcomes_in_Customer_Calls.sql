WITH

-- First call with 'No' outcome after 'Yes' per user
first_of_nos AS
    (SELECT
        call_id,
        ROW_NUMBER() OVER (ORDER BY date_of_call) AS no_group_id
    FROM
        (SELECT
            call_id,
            date_of_call,
            outcome = 'No' AND
            LAG(outcome) OVER (PARTITION BY user_id ORDER BY date_of_call) = 'Yes' AS first_no
        FROM calls
        ORDER BY date_of_call) AS sub
    WHERE first_no),

-- All consecutive 'No' outcomes per user grouped by id
group_of_nos AS
    (SELECT
        user_id,
        date_of_call,
        MAX(no_group_id) OVER (PARTITION BY user_id ORDER BY date_of_call) AS no_group_id
    FROM calls
    LEFT JOIN first_of_nos USING(call_id)
    WHERE outcome = 'No'
    ORDER BY date_of_call),

-- All consecutive 'No' outcomes numbered,
-- Numbering per user, numbering restart after a 'Yes'.
numbered_nos AS
    (SELECT
        user_id,
        date_of_call,
        ROW_NUMBER() OVER (PARTITION BY no_group_id ORDER BY date_of_call) AS nr
    FROM group_of_nos  
    ORDER BY date_of_call)

-- All 6. consecutive 'No' results per user.
SELECT
    user_id,
    date_of_call::TEXT
FROM numbered_nos
WHERE nr = 6
ORDER BY user_id, date_of_call;
