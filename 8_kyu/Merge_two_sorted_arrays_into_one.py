def merge_arrays(arr1, arr2):
    """
    Returns two lists merged, unique, sorted.
    """
    s = set(arr1)
    s.update(arr2)
    return sorted(s)