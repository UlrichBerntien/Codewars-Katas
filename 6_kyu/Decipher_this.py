import re

# Decipher sentence of words.
# Each word is deciphered as it owns.
def decipher_this(string: str) -> str:
    return " ".join( decipher_word(it) for it in string.split() )

# Pattern to match and split a cipherd word.
WORD = re.compile(r"^(\d+)(.*)$")

# Deciphers one word.
# - First letter is encoded as ASCII value in a decimal number.
# - Second letter is swapped with last letter.
def decipher_word(word: str) -> str:
    match = WORD.match(word)
    if match:
        asc = match.group(1)
        rest = match.group(2)
        if len(rest) > 1:
            rest = rest[-1] + rest[1:-1]  + rest[0]
        return chr(int(asc)) + rest
    else:
        # Error fallback
        return word
