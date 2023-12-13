def reverse_words(s: str) -> str:
    """
    Returns a string with all words in s in reversed order.
    """
    return " ".join(reversed(s.split()))
