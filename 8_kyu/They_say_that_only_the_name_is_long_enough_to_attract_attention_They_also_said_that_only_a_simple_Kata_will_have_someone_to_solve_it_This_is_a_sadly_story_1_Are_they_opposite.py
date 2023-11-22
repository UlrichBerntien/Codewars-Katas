def is_opposite(s1 :str, s2 :str) -> bool:
    """
    Checks is strings have same letters but opposite case.
    WARNING: Does not support special letters like  "β".upper() == "SS".
    """
    if not s1 or not s2:
        # Special case empty string
        return False
    return s1 == s2.swapcase()
