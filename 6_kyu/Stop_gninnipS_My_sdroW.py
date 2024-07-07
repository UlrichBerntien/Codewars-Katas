import re

# Reverses all words with 5 or more letters in the argument sentence.
# Supports only ASCII letters a-z and A-Z.
def spin_words(sentence: str) -> str:
    return WORD_5CHAR.sub(lambda m:m.group(0)[::-1], sentence)

# Pattern of word 5 or more letters
WORD_5CHAR = re.compile(r"\b[a-zA-Z]{5,}\b")