from typing import Iterable, Mapping

def sgn(x: int) -> int:
    """Return 1 if negative, 2 if positive"""
    return int(x>=0)+1

def solve(arr: Iterable[int]) -> int:
    # Map from absolute value to bits in an int coding the signs
    hash: Mapping[int,int] = {}
    # store the signs as bits in a hash table
    for it in arr:
        key = abs(it)
        hash[key] = hash.get(key,0) | sgn(it)
    # search the first not +/- item in the hash table
    for key, signs in hash.items():
        if  signs < 3:
            return key if signs == 2 else -key
    # error
    raise ValueError('all paired')