from typing import List

def next_id(arr: List[int]) -> int:
    candidate = 0
    for used in sorted(arr):
        if used > candidate:
            break
        candidate = used+1
    return candidate