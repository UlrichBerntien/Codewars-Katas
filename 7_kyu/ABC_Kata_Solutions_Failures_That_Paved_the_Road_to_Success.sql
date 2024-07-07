WITH
    -- Table of not completed including total budget of the project
    not_completed_project AS
    (SELECT
        project_id,
        project_name,
        completion_status,
        COALESCE(SUM(component_value),0) AS total_budget
    FROM
        projects
    LEFT JOIN
        budget_components USING (project_id)
    WHERE
        completion_status != 'Completed'
    GROUP BY
        project_id)
-- Table of not completed projects with total budget over average
SELECT
    project_id,
    project_name,
    completion_status,
    total_budget::TEXT::MONEY
FROM
    not_completed_project
WHERE
    total_budget > (SELECT AVG(total_budget) FROM not_completed_project)
ORDER BY
    project_name ASC;