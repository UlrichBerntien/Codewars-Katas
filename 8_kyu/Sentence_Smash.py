import typing as typ

def smash(words: typ.Iterable[str]) -> str:
    """
    Joins all words into one string separated by spaces.
    """
    return " ".join(words)
