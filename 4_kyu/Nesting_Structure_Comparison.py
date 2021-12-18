def len_or_not(x) -> int:
    """Len of x or -1 if x has no len method"""
    if isinstance(x, str):
        # in this kata a string is NOT an ARRAY of chars.
        return -1
    try:
        return len(x)
    except TypeError:
        return -1

def same_structure_as(original,other):
    original_len = len_or_not(original)
    other_len = len_or_not(other)
    if original_len != other_len:
        return False
    if original_len >= 0 and type(original) != type(other):
        # structured object must be of the same type
        # (type of unstructured objects could be different)
        return False
    for i in range(original_len):
        if not same_structure_as(original[i],other[i]):
            return False
    # all sub-structures same:
    return True
