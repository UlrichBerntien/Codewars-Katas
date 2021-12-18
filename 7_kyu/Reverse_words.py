import re

# Regex matches a word and the space between words.
WORD_OR_SPACE = re.compile(r"\s+|\S+")

def reverse_words(text: str) -> str:
    return "".join(it[::-1] for it in WORD_OR_SPACE.findall(text))