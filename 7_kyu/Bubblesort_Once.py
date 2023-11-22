def bubblesort_once(l: list) -> list:
    """
    Return the list l after one bubble sort step.
    Returns a copy of the list.
    """
    if not l:
        # empty list as special case
        return []
    # copy items from source to dest
    source = iter(l)
    dest = []
    a = next(source)
    for n in source:
        # copy item after one sort step in the dest
        if n < a:
            dest.append(n)
        else:
            dest.append(a)
            a = n
    dest.append(a)
    return dest
