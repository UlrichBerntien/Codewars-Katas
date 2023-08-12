-- Table of the used tags ranked by number of users tagged. 
SELECT
    ROW_NUMBER() OVER (ORDER BY tag_count DESC, tag ASC) AS tag_rank,
    tag,
    tag_count
FROM
    (SELECT
        UNNEST(STRING_TO_ARRAY(tags,',')) AS tag,
        COUNT(DISTINCT user_id) AS tag_count
    FROM user_tags
    GROUP BY tag) AS sub
ORDER BY tag_rank ASC, tag ASC;
