def string_to_array(s: str) -> list[str]:
    """
    Splits string s into list of all words.
    The word in s are separated by spaces.
    """
    return s.split() if s else [""]
