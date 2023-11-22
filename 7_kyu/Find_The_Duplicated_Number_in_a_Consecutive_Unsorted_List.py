def find_dup(arr: list[int]) -> int:
    """
    Returns the integer more than twice in the arr.
    Only integers >= 0 are alowed
    """
    # Map of integers. Bit 2^x = int x seen.
    seen = 0
    for x in arr:
        if x < 0: raise ValueError('negative int')
        bit = 1<<x
        if seen & bit:
            # Quick return after first doubled integer 
            return x
        seen |= bit
    # No integer seen more than once
    return None
