def small_enough(array, limit) -> bool:
    """
    Returns True if all items in array are less or equal limit, else returns False.
    """
    return all(item <= limit for item in array)
