import math

def get_chance(n :int, x :int, a :int) -> float:
    """
    Calculate probability not to draw a black marble.
    n - number of marble in the urn
    x - number of black marble in the urn
    a - number marble get without put back
    return probaility to get no black marble (rounded to 2 digits)
    see https://en.wikipedia.org/wiki/Urn_problem
    """
    if n < x or n < a or x < 0 or a < 0:
        raise ValueError("illegal arguments")
    k = n-x
    if k < a:
        p = 0
    else:
        p = math.prod( (k-j)/(n-j) for j in range(a) )
    return round(p,2)
