-- Calculate next fiscal year-end for UK companies.
SELECT
  filing_date,
  fiscal_year_end,
  CASE WHEN end1 > filing_date THEN end1 ELSE end2 END AS next_fiscal_year_end
FROM
  (SELECT
      id,
      filing_date,
      fiscal_year_end,
      make_date(date_part('year',filing_date)::int,substring(fiscal_year_end FOR 2)::int,substring(fiscal_year_end FROM 3)::int) AS end1,
      make_date(date_part('year',filing_date)::int+1,substring(fiscal_year_end FOR 2)::int,substring(fiscal_year_end FROM 3)::int) AS end2
  FROM uk_company_filings) AS fiscal_year_options
ORDER BY
  filing_date ASC,
  id DESC;
