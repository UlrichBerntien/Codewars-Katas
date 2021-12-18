SELECT
    left(project,commits) AS project,
    right(address,contributors) AS address
FROM repositories;