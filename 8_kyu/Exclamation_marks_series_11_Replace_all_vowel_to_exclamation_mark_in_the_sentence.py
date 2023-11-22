def replace_exclamation(s :str) -> str:
    """Translates all vowels into exclamation marks."""
    return s.translate(VOWELS2EX)

# All vowels
VOWELS='aeiouAEIOU'

# Translation table vowel to exclamation mark.
VOWELS2EX=str.maketrans(VOWELS,'!'*len(VOWELS))
