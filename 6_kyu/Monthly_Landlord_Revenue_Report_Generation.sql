-- Monthly Landlord Revenuue Report for April 2024
WITH
  -- Total monthly rents for each landlord
  rents AS
  (SELECT
    landlord_id,
    SUM(rent) AS total_rent
  FROM
    property
  GROUP BY
    landlord_id),

  -- Total costs in April 2024 for each landlord
  april_2024_costs AS
  (SELECT
    landlord_id,
    SUM(cost) AS total_cost
  FROM
    maintenance
  LEFT JOIN
    property ON property.id = maintenance.property_id
  WHERE
    '2024-04-01'::DATE <= maintenance_date AND maintenance_date < '2024-05-01'::DATE
  GROUP BY
    landlord_id)

-- Report rent, cost and payable for each landlord
SELECT
  landlord.id AS landlord_id,
  name,
  COALESCE(total_rent,0) AS total_rent,
  COALESCE(total_cost,0) AS total_cost,
  COALESCE(total_rent,0) - COALESCE(total_cost,0) AS amount_payable
FROM
  landlord
LEFT JOIN
  rents ON rents.landlord_id = landlord.id
LEFT JOIN
  april_2024_costs ON april_2024_costs.landlord_id = landlord.id
ORDER BY
  total_rent DESC,
  landlord_id DESC;
