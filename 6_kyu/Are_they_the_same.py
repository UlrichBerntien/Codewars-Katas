def comp(array1 :list[int], array2 :list[int]) -> bool:
    """
    Returns true if for each item in array1 an item² in array2 exists.
    """
    if not array1 or not array2:
        return array1 == array2
    return sorted(x**2 for x in array1) == sorted(array2)
