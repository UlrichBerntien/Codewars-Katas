def correct_polish_letters(text: str) -> str:
    """
    Returns text with Polish Alphabet diacritics removed.
    """
    return text.translate(POLISH_ALPHABET_DIACRITICS)

# Polish alphabet diacritics change table
POLISH_ALPHABET_DIACRITICS = str.maketrans("ąćęłńóśźż","acelnoszz")
