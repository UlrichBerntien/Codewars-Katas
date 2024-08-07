-- Reporting #tasks, #completed and #in-completed tasks per house.
WITH
  -- Summary tasks: A task is completed if all sub tasks are completed
  task_summary AS
  (SELECT
      task_id,
      EVERY(task_status IS NOT NULL AND task_status='Completed') AS is_completed
  FROM
      task_status
  GROUP BY
      task_id)

SELECT
    house_id,
    COUNT(*) AS total_tasks,
    COALESCE(SUM(is_completed::INT),0) AS completed_tasks,
    -- Count not completed and also tasks without task status as incomplete
    COUNT(*)-COALESCE(SUM(is_completed::INT),0) AS incomplete_tasks
FROM
    house_tasks
LEFT JOIN
    task_summary USING (task_id)
GROUP BY
    house_id
ORDER BY
    house_id DESC;
