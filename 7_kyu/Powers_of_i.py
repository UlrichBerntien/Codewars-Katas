def pofi(n: int) -> str:
    """
    Returns 1j**n as string.
    """
    return ("1","i","-1","-i")[n%4]