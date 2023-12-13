def f(x: float) -> float:
    """
    Returns value of function sqrt(1+x)-1
    """
    if abs(x) < 1e-3:
        # Taylor series of f(x) = sqrt(1+x)-1 at x = 0:
        # https://www.wolframalpha.com/input/?i=series+sqrt%28x%2B1%29-1+at+x%3D0
        # f(x) = x/2 - x^2/8 + x^3/16 - (5 x^4)/128 + (7 x^5)/256 - (21 x^6)/1024 + O(x^7)
        sum = 0
        xi = x
        for v in (1/2, -1/8, 1/16, -5/128, 7/256, -21/1024):
            sum += xi * v
            xi *= x
        return sum
    else:
        return (1+x)**0.5-1
