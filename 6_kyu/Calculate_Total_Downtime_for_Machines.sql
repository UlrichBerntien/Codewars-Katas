WITH

-- Total downtime per machine.
-- Only downtimes between the stored process times.
-- Downtime after last process not included.
machine_down_times AS
(SELECT
    machine_id,
    SUM(end_down_time - start_down_time) AS total_down_time
FROM
    -- Intervals of the downtimes are the intervals between the process times.
    (SELECT
        machine_id,
        end_time AS start_down_time,
        LEAD(start_time) OVER (PARTITION BY machine_id ORDER BY start_time) AS end_down_time
    FROM process_times) AS dt
WHERE start_down_time < end_down_time
GROUP BY machine_id)

-- Total downtime for machines
-- time formated as string 'hours:minutes:seconds'.
SELECT
    machine_id,
    DATE_PART('day',total_down_time)*24+DATE_PART('hour',total_down_time)
    || (TO_CHAR(total_down_time,':MI:SS')) AS total_down_time
FROM machine_down_times
ORDER BY machine_id DESC;
