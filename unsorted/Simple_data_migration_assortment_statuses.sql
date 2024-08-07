-- Insert products stored in stores part of clusters
-- into the product cluster statuses table.
WITH

-- Collect all products in clusters.
-- Count the used status ID codes for selection in the next step.
products_in_clusters AS
    (SELECT
        product_id,
        cluster_id,
        status_id,
        COUNT(*) AS status_id_count,
        priority
    FROM
        product_store_statuses AS products
    LEFT JOIN
        stores AS stores ON products.store_id = stores.id
    LEFT JOIN
        statuses ON products.status_id = statuses.id
    WHERE
        product_id IS NOT NULL
        AND cluster_id IS NOT NULL
        AND status_id IS NOT NULL
    GROUP BY
        product_id, cluster_id, status_id, priority
)

INSERT
INTO
    product_cluster_statuses(product_id,cluster_id,status_id)
SELECT DISTINCT
    product_id,
    cluster_id,
    FIRST_VALUE(status_id) OVER (PARTITION BY product_id, cluster_id ORDER BY status_id_count DESC, priority ASC) AS status_id
FROM
    products_in_clusters
ON CONFLICT DO NOTHING;

-- Remove products doubels from stores statuses.
DELETE
FROM
    product_store_statuses AS instore
USING
    product_cluster_statuses AS incluster,
    stores
WHERE
    -- same product with same status:
    instore.product_id = incluster.product_id AND
    instore.status_id = incluster.status_id AND
    -- in the cluster of the store:
    instore.store_id = stores.id AND
    incluster.cluster_id = stores.cluster_id;
