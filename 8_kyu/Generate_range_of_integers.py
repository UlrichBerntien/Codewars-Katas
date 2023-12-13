def generate_range(min: int, max: int, step: int) -> list[int]:
    """
    Returns list of integers from min to max (including), with the step.
    """
    return list(range(min,max+1,step))
