def to_freud(sentence: str) -> str:
    """
    Replaces any sequence of non-spaces.
    """
    n = sentence.count("\x20") + (sentence != "")
    return " ".join("sex" for _ in range(n))
