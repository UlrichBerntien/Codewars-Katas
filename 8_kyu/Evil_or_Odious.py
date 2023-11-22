def evil(n: int) -> str:
    """
    Counts the number of 1 bits in the integer n.
    Returns "It's Odious/Evil" if number of 1 bits is odd/even.
    """
    return "It's Odious!" if n.bit_count() % 2 else "It's Evil!"
