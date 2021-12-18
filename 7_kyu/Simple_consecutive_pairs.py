from typing import List

def pairs(ar: List[int]) -> int:
    """Returns number of consecutive (up or down) in the list."""
    return sum( abs(ar[it+1]-ar[it]) == 1 for it in range(0,len(ar)-1,2) )
