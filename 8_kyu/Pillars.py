# Factor convert meter to centimeter (cm)
M_TO_CM = 100

# Calulates total distance between pillars.
# Arguments
#   num_pill - Number of pillars
#   dist - Distance between pillars in meter
#   width - Width of a pillar in cm
# Return
#   Distance between first and last pillar in cm.
#   Distance without the width of first and last pillar.
def pillars(num_pill, dist, width):
    if num_pill < 1:
        raise ValueError("#pillars must be above 1")
    if dist <= 0:
        raise ValueError("pillar distance must be positive")
    if width <= 0:
        raise ValueError("pillar width must be positive")
    dist_cm = dist * M_TO_CM
    return dist_cm*(num_pill-1) + width*max(0,num_pill-2)
