def area_or_perimeter(l :float, w :float) -> float:
    """
    Calculates the area if it is a square or the perimeter if it is a rectangle.
    """
    return l*l if l == w else 2*(l+w)
