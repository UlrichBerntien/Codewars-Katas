import math

def round_it(n: float) -> int:
    """Rounds argument n to an integer with different methods."""
    digits = str(n).split('.')
    if len(digits) == 1 or len(digits[0]) > len(digits[1]):
        return math.floor(n)
    elif len(digits[0]) == len(digits[1]):
        return round(n)
    else:
        return math.ceil(n)