WITH

-- Table with matrix meta data (lengths)
-- and matrix spitted in elements.
matrix_unnested AS
(SELECT
    ROW_NUMBER() OVER () - 1 AS matrix_id,
    ARRAY_LENGTH(matrix,1) AS len_x,
    ARRAY_LENGTH(matrix,2) AS len_y,
    UNNEST(matrix) AS elm
FROM public.matrices),

-- Table with elements and index of all elements in each matrix.
elements_with_ids AS
(SELECT
    matrix_id,
    (ROW_NUMBER() OVER (PARTITION BY matrix_id) - 1) % len_y AS index_x,
    (ROW_NUMBER() OVER (PARTITION BY matrix_id) - 1) / len_y AS index_y,
    elm
FROM matrix_unnested),

-- Inner arrays of the matrixes collected.
inner_arrays_with_ids AS
(SELECT
    matrix_id,
    index_x,
    ARRAY_AGG(elm ORDER BY index_y) AS inner_array
FROM elements_with_ids
GROUP BY matrix_id, index_x)

-- Table of the transposed two-dimensional matrices.
SELECT
    ARRAY_AGG(inner_array ORDER BY index_x) AS matrix
FROM inner_arrays_with_ids
GROUP BY matrix_id;
