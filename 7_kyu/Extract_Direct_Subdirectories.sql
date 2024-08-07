-- Extract "subdirectory" of given directory from path.
SELECT DISTINCT
    substring(path, '^/home/user/pictures/([^/]+)') AS subdirectory
FROM
    directories
WHERE
    path ~ '^/home/user/pictures/[^/]+'
ORDER BY
    subdirectory;