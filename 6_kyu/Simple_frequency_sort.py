from collections import Counter
from typing import List

def solve(arr: List[int]) -> List[int]:
    counted = Counter(arr).most_common()
    counted = sorted(counted,key=lambda x: x[0]) # sort by value
    counted = sorted(counted,key=lambda x: x[1],reverse=True) # sort by count
    result = []
    for value, count in counted:
        result += [value] * count
    return result