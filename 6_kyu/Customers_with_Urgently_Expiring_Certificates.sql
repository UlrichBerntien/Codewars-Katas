-- Customers with urgently expiring certificates
WITH
critical_customers AS
    -- Customers without a valid certificate after 14 days are critical.
    (SELECT ssn
    FROM certs
    GROUP BY ssn
    HAVING MAX(cert_finish) <= CURRENT_DATE+'14 days'::INTERVAL)

-- List of all expiring certificates for the next 14 days
-- for the most critical customers.
SELECT
    name,
    cc.ssn,
    cert_num,
    cert_start,
    cert_finish
FROM
    critical_customers AS cc
LEFT JOIN
    certs USING(ssn)
LEFT JOIN
    customers USING (ssn)
WHERE
    CURRENT_DATE <= cert_finish AND cert_finish <= CURRENT_DATE+'14 days'::INTERVAL
ORDER BY
    name ASC,
    cc.ssn ASC,
    cert_num ASC;
