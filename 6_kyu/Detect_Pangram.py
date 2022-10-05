from collections import Counter
from string import ascii_lowercase

# Checks if all letters (a-z) are in the string.
# Returns true if all letters in the string, else false.
# Checks the letters caseless.
def is_pangram(s: str) -> bool:
    # Count characters caseless
    count = Counter( s.casefold() )
    # Check all letters (only a-z)
    for c in ascii_lowercase:
        if count[c] < 1:
            return False
    # Ok, all letters at least once in the string
    return True
