--  The name of the team member who last worked on the task, excluding the current stage.
SELECT
    task_id,
    (array_remove(ARRAY[completion,final_review,second_review,first_review,initial_assignment],NULL))[2] AS second_last_contributor
FROM
    project_tasks
ORDER BY
    task_id DESC;