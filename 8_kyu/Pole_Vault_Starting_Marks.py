def starting_mark(height: float) -> float:
    """
    Calculates the start mark distance for the first attempt.
    height -- height of the pole vaulter in meters
    return -- distance in meters
    """
    # nodes of the linear function
    point = ((1.52,9.45), (1.83,10.67))
    # linear interpolation and extrapolation
    x = (height-point[0][0])/(point[1][0]-point[0][0])
    y = point[0][1] + x * (point[1][1]-point[0][1])
    # Return value rounded
    return round(y,2)
