def square_or_square_root(arr: list[int]) -> list[int]:
    """
    Returns list with each item square or square root.
    """
    return [s_or_s(x) for x in arr]

def s_or_s(x :int) -> int:
    """
    Returns square root of x if it is an integer, else return x squared.
    """
    r = x**0.5
    return int(r) if r%1 == 0 else x**2