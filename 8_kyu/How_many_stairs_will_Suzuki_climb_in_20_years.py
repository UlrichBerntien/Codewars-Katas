import typing as type

def stairs_in_20(stairs: type.Iterable[type.Iterable[int]]) -> int:
    """
    Returns extimation of stairs in 20 years.
    stairs -- List of List of number of stairs per day, in sum number of stairs in one year.
    Return -- Estimated stairs = 20 * stairs in one year.
    """
    return 20*sum(sum(st) for st in stairs)
