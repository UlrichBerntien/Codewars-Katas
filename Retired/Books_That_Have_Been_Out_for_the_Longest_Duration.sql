WITH

-- Table of borrow intervals per loan.
-- Current date is used for not returned books as end date.
loan_durations AS
    (SELECT
        loan_id,
        COALESCE(return_date,CURRENT_DATE)
            - LAG(return_date) OVER (PARTITION BY book_id ORDER BY return_date)
            AS borrow_interval
    FROM loans),

-- Maximal borrow duration in days.
max_loan_duration AS
    (SELECT MAX(borrow_interval)
    FROM loan_durations)

-- Table of loans with the longest duration.
-- All loans with maximal duration are included.
SELECT
    b.book_id,
    b.title,
    b.author,
    l.loan_id,
    l.borrower_name,
    m.max||' Days' AS longest_borrow_interval
FROM max_loan_duration AS m
JOIN loan_durations AS d ON d.borrow_interval = m.max
JOIN loans AS l USING (loan_id)
JOIN books AS b USING (book_id)
ORDER BY d.loan_id;
