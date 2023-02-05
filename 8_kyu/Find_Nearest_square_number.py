import math

# Calculates x² with integer x, so that n-x² is minimal.
def nearest_sq(n: int) -> int:
    return int(math.pow(round(math.sqrt(n)),2))
