-- Select all books thar were returned.
-- No books never loaned, no books not yet returned.
SELECT
  book_id,
  title
FROM
( SELECT book_id 
  FROM loans 
  GROUP BY book_id
  HAVING NOT bool_or(return_date IS NULL)
  ) AS loaned_and_returned
JOIN books USING (book_id) 
ORDER BY book_id DESC;
