from collections.abc import Iterable

# Filters list of integers.
# Items which are multiple of the index passes the filter.
def multiple_of_index(arr: Iterable[int]) -> list[int]:
    return [x for i,x in enumerate(arr) if i > 0 and x%i==0]
