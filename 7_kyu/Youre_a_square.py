import math

def is_square(n):    
    try:
        # Support of Python < 3.8, so no isqrt usage here
        lower = math.ceil(math.sqrt(n))
        # handling of floating point rounding errors
        return lower*lower == n or (lower+1)*(lower+1) == n
    except ValueError:
        return False