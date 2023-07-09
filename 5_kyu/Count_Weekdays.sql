-- Returns the number of weekdays (Mo-Fr) between day1 and day2 including.
CREATE OR REPLACE FUNCTION weekdays(day1 date, day2 date) RETURNS integer
AS $$
  DECLARE first date := LEAST(day1,day2);
  DECLARE last date := GREATEST(day1,day2);
  DECLARE delta_days integer;
  DECLARE week_days integer;
  DECLARE dow integer;
  BEGIN
    -- all days between first and last including first and last day
    delta_days = last - first + 1;
    -- full weeks between first and last
    week_days = 5 * (delta_days / 7);
    -- rest of the days, part of a week
    delta_days = delta_days % 7;
    dow = EXTRACT(dow FROM first);
    WHILE delta_days > 0 LOOP
      IF dow BETWEEN 1 AND 5 THEN
        week_days = week_days + 1;
      END IF;
      dow = (dow + 1) % 7;
      delta_days = delta_days - 1;
    END LOOP;
    RETURN week_days;
  END
$$ LANGUAGE plpgsql
