def cycle(d :int, v :list, c):
    """
    Returns item before/after item c in the list v.
    d -- negative value: before first c, positive value: after last c
    v -- search in this list
    c -- search for this item
    return -- the item before first/after last c in v.
    """
    try:
        i = v.index(c)
        if d > 0:
            return v[(i+1) % len(v)]
        else:
            return v[i-1]
    except ValueError:
        return None
