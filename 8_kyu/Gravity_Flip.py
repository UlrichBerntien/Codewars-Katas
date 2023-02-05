from collections.abc import Iterable

# Return array sorted.
def flip(direction: str, array: Iterable[int]) -> list[int]:
    # Copy to keep the argument unchanged.
    cpy = list(array)
    cpy.sort(reverse=direction=="L")
    return cpy
