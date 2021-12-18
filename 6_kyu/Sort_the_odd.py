from typing import List

def sort_array(source_array: List[int]) -> List[int]:
    """Returns the array with sorted odd numbers."""
    isodd = lambda x: x & 1 > 0
    odds_sorted = sorted( filter(isodd,source_array) )
    source_odds = iter(odds_sorted)
    destination = []
    for s in source_array:
        destination.append( next(source_odds) if isodd(s) else s )
    return destination