from collections.abc import Iterable

# Returns the numbers as list without the minimum value.
# Only the first minimum value is removed if the minimum is not unique
def remove_smallest(numbers: Iterable[int]) -> list[int]:
    lst = list(numbers)
    if lst:
        lst.remove(min(lst))
    return lst
