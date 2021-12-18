import math

def approx_equals(a, b):
    return math.isclose(a, b, rel_tol=0, abs_tol=0.001)