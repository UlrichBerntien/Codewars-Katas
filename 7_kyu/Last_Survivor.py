from typing import Iterable

def last_survivor(letters: str, coords: Iterable[int]) -> str: 
    """
    Removes from letters the chars at coords index.
    Returns the first survivor letter.
    """
    arr = list(letters)
    for idx in coords:
        del arr[idx]
    return arr[0]