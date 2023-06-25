-- Generates table
--    distance_to_pump = the given distance [miles] to the next pump.
--    mpg = given miles per gallon range of the car
--    fuel_left = given fuel [gallon] amount in the car
--    res = True if the car can reach the next pump, else False
SELECT
  distance_to_pump,
  mpg,
  fuel_left,
  distance_to_pump <= fuel_left*mpg AS res
FROM zerofuel;
