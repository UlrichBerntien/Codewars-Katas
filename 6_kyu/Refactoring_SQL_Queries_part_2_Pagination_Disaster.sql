-- Collect total amounts per deal in JSON data.
SELECT
    deal_id,
    deal_name,
    (SELECT
        JSON_AGG(JSON_BUILD_OBJECT('currency',t.currency,'total_amount',t.total_amount)) AS currency_details
     FROM
       (SELECT
          tt.currency,
          SUM(tt.amount) AS total_amount
       FROM
          tranches AS tt
       WHERE tt.deal_id = deals.deal_id
       GROUP BY tt.currency
       ORDER BY tt.currency ASC) AS t
    ) AS currency_details
FROM
    deals
ORDER BY
    deal_id DESC;
