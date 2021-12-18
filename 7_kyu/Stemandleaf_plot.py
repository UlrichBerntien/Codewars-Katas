from bisect import insort
from typing import List, Dict

def stem_and_leaf(data: List[int]) -> Dict[int,List[int]]:
    """Returns the numbers stem-leaf grouped."""
    accu = {}
    for x in data:
        stem, leaf = divmod(x,10)
        if stem not in accu: accu[stem] = []
        insort(accu[stem],leaf)
    return accu
