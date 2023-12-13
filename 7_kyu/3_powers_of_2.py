def three_powers(n: int) -> bool:
    """
    Returns True if n can be represented as sum of 3 powers of 2.
    """
    return n.bit_count() == 3 or (n > 2 and n.bit_count() <= 3)