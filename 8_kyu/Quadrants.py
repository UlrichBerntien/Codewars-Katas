def quadrant(x :float, y :float) -> int:
    """
    Quadrant 1-4 of the point (x,y) in the plane.
    """
    if x >= 0:
        return 1 if y >= 0 else 4
    else:
        return 2 if y > 0 else 3
