# Converts bool value to Yes/No string.
def bool_to_word(b: bool) -> str:
    return ("No","Yes")[b]
