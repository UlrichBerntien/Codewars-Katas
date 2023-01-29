from typing import List
import itertools

def bits_hbf(n : int) -> List[bool]:
    """int splitted in bits, highest bit first"""
    if n <= 0:
        return [False]
    accu = []
    while n > 0:
        accu.insert(0, bool(n & 1))
        n >>= 1
    return accu

def swap(s: str, n: int) -> str:
    bits = itertools.cycle(bits_hbf(n))
    index = range(len(s))
    cases = (s, s.swapcase())
    return ''.join( cases[s[i].isalpha() and next(bits)][i] for i in index)
