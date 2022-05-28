def interlockable(a: int, b: int) -> bool:
    return not bool(a & b)
