def zero_fuel(distance_to_pump :float, mpg :float, fuel_left :float) -> bool:
    """
    Checks if fuel left is enough for drive to next pump.
    distance_to_pump -- the given distance [miles] to the next pump.
    mpg -- given miles per gallon range of the car
    fuel_left -- given fuel [gallon] amount in the car
    return -- True if the car can reach the next pump, else False
    """
    return distance_to_pump/mpg <= fuel_left
