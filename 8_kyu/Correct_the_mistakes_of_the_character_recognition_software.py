def correct(s: str) -> str:
    """
    Corrects mistackes in string.
    Returns string with translated chars 5->S,0->I,1->I.
    """
    return s.translate(CORRECTION_TABLE)

# Table to correct invalid scanned letters.
CORRECTION_TABLE = str.maketrans("501","SOI")
