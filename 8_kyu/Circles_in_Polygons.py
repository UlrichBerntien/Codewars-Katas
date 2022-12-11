from math import tan, pi

# Calculates incircle diameter of equal sided polygon.
# Arguments:
#   sides - Numer of sides
#   side_length - length of one side
# Return:
#   Diameter of the incircle
def circle_diameter(sides: int, side_length: int|float) -> float: 
    if sides < 3 or side_length < 0:
        raise ValueError()
    else:
        return side_length / tan(pi/sides)
