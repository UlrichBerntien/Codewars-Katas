--  List relevant dosage information.
SELECT
    record_id,
    drug_name,
    drug_amount,
    CASE
        -- drug unit could be given as "drug_unit_id/check_unit_id"
        WHEN check_unit_id IS NOT NULL THEN primary_unit.unit_name||'/'||check_unit.unit_name
        -- or drug unit is already summarised in "drug_unit_id"
        ELSE primary_unit.unit_name
    END AS dose_units
FROM
    dose_records
INNER JOIN
    -- ignore records containing unknown drug IDs.
    drugs USING(drug_id)
LEFT JOIN
    units AS primary_unit ON primary_unit.unit_id = drug_unit_id
LEFT JOIN
    units AS check_unit ON check_unit.unit_id = check_unit_id
ORDER BY
    drug_name ASC,
    record_id ASC;