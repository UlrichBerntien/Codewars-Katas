def remove(s: str) -> str:
    """
    Returns string s with one exclamation at the end.
    All other exclamation marks in s are remove.
    """
    return s.translate(TRANSLATE_REMOVE_EXCLAMATION) + "!"

# Static translation table to remove exclamation mark.
TRANSLATE_REMOVE_EXCLAMATION = str.maketrans("","","!")