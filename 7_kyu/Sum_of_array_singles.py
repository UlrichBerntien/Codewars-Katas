from typing import List
from collections import defaultdict

def repeats(arr: List[int]) -> int:
    """Returns sum of a single numbers in arr."""
    occurs = defaultdict(int)
    for it in arr:
        occurs[it] += 1
    return sum(it for it,count in occurs.items() if count == 1)
