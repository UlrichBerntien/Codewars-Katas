def close_compare(a: int, b: int, margin: int = 0) -> int:
    delta = a-b
    if -margin <= delta <= margin:
        return 0
    elif delta < 0:
        return -1
    else:
        return +1