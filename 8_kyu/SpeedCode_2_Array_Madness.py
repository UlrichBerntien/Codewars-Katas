from typing import Iterable

def array_madness(a: Iterable[int], b: Iterable[int]) -> bool:
    return sum(x*x for x in a) > sum(x*x*x for x in b)
