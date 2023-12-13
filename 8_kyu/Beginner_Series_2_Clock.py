def past(h: int, m: int, s: int) -> int:
    """
    Converts hours, minutes, seconds into milliseconds.
    h -- hours
    m -- minutes
    s -- seconds
    return -- milliseconds
    """
    return 1000*(60*(60*h+m)+s)
