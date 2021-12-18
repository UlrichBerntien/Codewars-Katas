import math

def distance_between_points(a, b):
    return math.sqrt( math.pow(a.x-b.x,2) + math.pow(a.y-b.y,2) )
