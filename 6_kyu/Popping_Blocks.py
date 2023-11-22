def pop_blocks(lst: list) -> list:
    """
    Returns the list lst without consecutive repeated elements.
    """
    # work on a copy, keep original list unchanged
    result = list(lst)
    i = 0
    while i < len(result)-1:
        if result[i] == result[i+1]:
            # Remove all duplicates
            while i+1 < len(result) and result[i+1] == result[i]:
                del result[i+1]
            # remove also the origianl
            del result[i]
            if i > 0: i -= 1
        else:
            i += 1
    return result
