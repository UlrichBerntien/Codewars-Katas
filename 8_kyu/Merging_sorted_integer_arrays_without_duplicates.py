from typing import List

def merge_arrays(first: List[int], second: List[int]) -> List[int]: 
    accu: List[int] = []
    last = None
    def accu_append(x: int):
        "add x to accu if no dupplicate"
        nonlocal last, accu
        if last != x:
            accu.append(last := x)
    first_index, second_index = 0, 0
    first_len, second_len = len(first), len(second)
    # merge the two ordered lists until end of one list is reached
    while first_index < first_len and second_index < second_len:
        if first[first_index] < second[second_index]:
            accu_append(first[first_index])
            first_index += 1
        else:
            accu_append(second[second_index])
            second_index += 1
    # add rest of first list without duplicates
    while first_index < first_len:
        accu_append(first[first_index])
        first_index += 1
    # or: add rest of second list without duplicates
    while second_index < second_len:
        accu_append(second[second_index])
        second_index += 1
    return accu