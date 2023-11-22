def get_real_floor(n: int) -> int:
    """
    Returns european floor number for the given american floor number.
    US: ground floor is 1 (not 0) and floor 13 is skipped.
    """
    return n - int(n > 0) - int(n > 12)