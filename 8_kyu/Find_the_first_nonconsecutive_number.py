def first_non_consecutive(arr: list[int]) -> int|None:
    """
    Returns first non-consecutive number in the arr.
    Returns None if no such number exists (empty list or complete list).
    """
    if not arr:
        return
    for value_by_index,value in enumerate(arr, arr[0]):
        if value != value_by_index:
            return value
    return
