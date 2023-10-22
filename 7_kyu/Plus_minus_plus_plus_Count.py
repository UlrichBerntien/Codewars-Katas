def catch_sign_change(lst: list[int]) -> int:
    """
    Returns number of sign changes in the list.
    Remark: Sign of 0 is "+".
    """
    return sum( (a>=0) != (b>=0) for a,b in zip(lst,lst[1:]) )