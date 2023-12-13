import typing as typ

def array_diff(a: typ.Iterable, b: typ.Iterable) -> list:
    """
    Returns a without all items in b.
    Keeps order of a. Removes all occurences of the items.
    """
    setb = frozenset(b)
    return [x for x in a if x not in setb]
