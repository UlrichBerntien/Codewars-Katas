WITH

-- Numbered category range boundary.
-- The index is based on the order of the range boundaries.
numbered_categories AS
(SELECT
    ROW_NUMBER() OVER (ORDER BY category, range) AS i,
    category,
    range
FROM categories
ORDER BY i)

-- Table of collected range pairs.
-- WARNING: Range overlaps are not handled.
SELECT
    c1.category,
    c1.range AS start_range,
    c2.range AS end_range
FROM numbered_categories AS c1
JOIN numbered_categories AS c2 ON c2.category = c1.category AND c2.i = c1.i + 1 
WHERE c1.i % 2 = 1
ORDER BY start_range;
