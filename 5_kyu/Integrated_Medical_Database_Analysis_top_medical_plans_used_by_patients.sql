WITH

-- Table of total transactions per IMD.
totals AS
(SELECT
    imd_id,
    SUM(total_trx_per_plan)::NUMERIC AS trx
FROM plan_usage_summary
GROUP BY imd_id
ORDER BY imd_id),

-- Table of transaction plans ranked by number of transactions per IMD.
plan_summary_ranked AS
(SELECT
    imd_id,
    plan_name,
    total_trx_per_plan::NUMERIC,
    ROW_NUMBER() OVER (PARTITION BY imd_id ORDER BY total_trx_per_plan DESC) AS plan_rank
FROM plan_usage_summary
WHERE plan_name IS NOT NULL AND plan_name <> '0')

-- Pivot table of the top 3 transaction plans per IMD.
--    Top, means most number of transactions.
--    The number of transaction are relative to the total number of transactions per IMD.
SELECT
    first.imd_id,
    first.plan_name AS top_first_plan,
    ROUND(first.total_trx_per_plan/totals.trx,2) AS top_first,
    second.plan_name AS top_second_plan,
    ROUND(second.total_trx_per_plan/totals.trx,2) AS top_second,
    third.plan_name AS top_third_plan,
    ROUND(third.total_trx_per_plan/totals.trx,2) AS top_third
FROM plan_summary_ranked AS first
NATURAL JOIN totals
LEFT JOIN plan_summary_ranked AS second ON second.imd_id = first.imd_id AND second.plan_rank = 2
LEFT JOIN plan_summary_ranked AS third ON third.imd_id = first.imd_id AND third.plan_rank = 3
WHERE first.plan_rank = 1
ORDER BY first.imd_id ASC;
