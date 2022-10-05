import re

# Pattern finding a word.
# First char in first group, other chars in the second group.
WORD_GROUPED = re.compile(r"\b(\S)(\S*)")

# Returns a "simple pig latin" text.
def pig_it(text: str) -> str:
    return WORD_GROUPED.sub(r"\2\1ay", text)
