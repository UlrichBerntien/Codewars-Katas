def split_integer(num :int, parts: int) -> list[int]:
    """
    Splits the integer num into #parts integers.
    The difference between the parts is at maximum of 1.
    The parts are sorted in ascending order.
    """
    p, r = divmod(num, parts)
    splits = [p] * parts
    for i in range(parts-r,parts):
        splits[i] += 1
    return splits