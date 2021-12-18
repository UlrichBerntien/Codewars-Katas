# Translation table to remove the exclamation mark.
EXCLAMATION_REMOVER = str.maketrans("","","!")

def remove_exclamation_marks(s: str) -> str:
    "Returns the string s without exclamation signs."
    return s.translate(EXCLAMATION_REMOVER)