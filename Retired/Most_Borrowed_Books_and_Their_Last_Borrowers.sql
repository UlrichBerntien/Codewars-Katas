-- Table of top borrowed books.
WITH

-- Table of top borrowed books.
-- The books most borrowed. Could be 1 or more books.
top_loans AS
  (SELECT
      book_id,
      loan_count
  FROM
      (SELECT
          book_id,
          COUNT(loan_id) AS loan_count,
          RANK() OVER (ORDER BY COUNT(loan_id) DESC) AS rank
      FROM loans
      GROUP BY book_id) AS loans_ranked
  WHERE rank = 1)

SELECT
    top.book_id,
    book.title,
    top.loan_count,
    -- The current borrower of the last borrower
    COALESCE(
      (SELECT borrower_name FROM loans WHERE book_id = top.book_id AND return_date IS NULL),
      (SELECT borrower_name FROM loans WHERE book_id = top.book_id ORDER BY return_date DESC LIMIT 1)
    ) AS last_borrower
FROM top_loans AS top
JOIN books AS book USING (book_id)
ORDER BY book_id ASC;
