import typing

def mul_by_n(lst :typing.Iterable, n) -> typing.List:
    """
    Returns a list with each item of lst multplied by n.
    """
    return [x * n for x in lst]
