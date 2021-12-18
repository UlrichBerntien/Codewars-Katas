import re

# A pattern matching two consecutive doubled word.
# The group 1 is the word which is doubled.
DOUBLE_WORD_PATTERN = re.compile(r"\b(\w+)\s+\1\b")

def remove_consecutive_duplicates(s: str) -> str:
    """Returns s without consecutive doubled words."""
    while (n:=DOUBLE_WORD_PATTERN.sub(r"\1",s)) != s:
        s = n
    return n