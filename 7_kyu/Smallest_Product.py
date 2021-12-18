from typing import List
from functools import reduce

def smallest_product(a: List[List[int]]) -> int:
    return min(reduce(int.__mul__,it) for it in a)