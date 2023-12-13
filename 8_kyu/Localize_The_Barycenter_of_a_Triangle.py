def bar_triang(point_a: list[float,float], point_b: list[float,float], point_c: list[float,float]) -> list[float,float]: 
    """
    Calculates barycenter of a triangle.
    Format of all points: list of X and Y coordinate.
    Return coordinates are rounded to 4 digits.
    """
    b = [(point_a[i]+point_b[i]+point_c[i])/3 for i in (0,1)]
    return [round(coord,4) for coord in b]
