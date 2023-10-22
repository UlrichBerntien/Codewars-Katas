def even_numbers(arr: list[int],n :int) -> list[int]:
    """
    Returns the last n even numbers in list arr.
    """
    result = []
    for x in reversed(arr):
        if x%2 == 0:
            result.insert(0,x)
            if len(result) == n:
                return result
    return result