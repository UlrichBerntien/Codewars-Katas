from typing import List
import io
import itertools

def bits_hbf(n : int) -> List[int]:
    """int splitted in bits, highest bit first"""
    if n <= 0:
        return [0]
    accu = []
    while n > 0:
        accu.insert(0, n & 1)
        n >>= 1
    return accu

def swap(s: str, n: int) -> str:
    bits = itertools.cycle(bits_hbf(n))
    cases = (s, s.swapcase())
    accu = io.StringIO()
    for i in range(len(s)):
        if s[i].isalpha():
            accu.write(cases[bits.__next__()][i])
        else:
            accu.write(s[i])
    return accu.getvalue()
