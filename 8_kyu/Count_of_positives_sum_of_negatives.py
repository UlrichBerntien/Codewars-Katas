import typing as typ

def count_positives_sum_negatives(arr: typ.Iterable[int]) -> list[int]:
    """
    Counts the positve numbers and sum neative numbers.
    0 is not positive, hence not counted.
    Returns list [count of positive, sum of negative numbers].
    """
    if not arr:
        # Special case: empty array
        return []
    count_pos = 0
    sum_neg = 0
    for x in arr:
        if x > 0:
            count_pos += 1
        else:
            sum_neg += x
    return [count_pos, sum_neg]
