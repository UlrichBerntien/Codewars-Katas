-- New table of all dishes.
-- Stores the menue items as dishes in a new table.
CREATE TABLE dishes AS
SELECT
  id as restaurant_id,
  UNNEST(STRING_TO_ARRAY(menu,',')) as dish
FROM restaurants;

-- New table of restaurants.
-- Removes the menu column with aggregates.
ALTER TABLE restaurants
DROP COLUMN menu;
