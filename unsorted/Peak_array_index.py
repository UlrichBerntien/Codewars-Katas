from typing import List

def peak(arr: List[int]) -> int:
    delta_sum = 0
    left_index = 0
    right_index = len(arr) - 1
    while left_index < right_index:
        if delta_sum <= 0:
            delta_sum += arr[right_index]
            right_index -= 1
        else:
            delta_sum -= arr[left_index]
            left_index += 1
    return left_index if delta_sum == 0 else -1