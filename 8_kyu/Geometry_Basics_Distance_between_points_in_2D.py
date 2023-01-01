import math

def distance_between_points(a, b):
    return math.hypot( a.x-b.x, a.y-b.y )
