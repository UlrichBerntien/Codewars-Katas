import math

def digits(n: int) -> int:
    """
    Returns the number of decimal digits for number n.
    n must be a not-negative integer.
    """
    return int(math.log10(n) + 1) if n > 0 else 1