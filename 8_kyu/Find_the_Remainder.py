# Calculate the remainder of max/min.
def remainder(a: int,b : int) -> int:
    try:
        return max(a,b) % min(a,b)
    except ZeroDivisionError:
        return None
