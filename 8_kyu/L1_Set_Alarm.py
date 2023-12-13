def set_alarm(employed: bool, vacation: bool) -> bool:
    """
    Returns True if you are employed and not on vacation.
    """
    return employed and not vacation
