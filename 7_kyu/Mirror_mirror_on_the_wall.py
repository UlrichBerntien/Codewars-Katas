from typing import List

def mirror(data: List[int]) -> List[int]:
    if len(data) < 2:
        return data
    else:
        data_sorted = sorted(data)
        return data_sorted + data_sorted[len(data_sorted)-2::-1]
