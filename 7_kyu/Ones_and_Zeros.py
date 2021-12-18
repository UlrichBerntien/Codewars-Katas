from typing import List

def binary_array_to_number(arr: List[int]) -> int:
    """Returns the value of arr interpreted as binary number."""
    accu = 0
    value = 1
    for a in reversed(arr):
        if a: accu += value
        value *= 2
    return accu        