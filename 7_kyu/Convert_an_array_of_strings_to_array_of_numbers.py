from collections.abc import Iterable

# Convert into list of floats
def to_float_array(arr: Iterable) -> list[float]: 
    return list(float(it) for it in arr)
