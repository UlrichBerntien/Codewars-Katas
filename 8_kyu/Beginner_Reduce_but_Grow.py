from functools import reduce
from collections.abc import Iterable

# Returns product of all intergers in arr.
def grow(arr: Iterable[int]) -> int:
    return reduce( int.__mul__, arr)
