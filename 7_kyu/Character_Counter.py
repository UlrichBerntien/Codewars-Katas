from collections import Counter

def validate_word(word: str) -> bool:
    counts = list(Counter(word.casefold()).values())
    return counts[:-1] == counts[1:]
