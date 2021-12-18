# set of vowels
VOWELS = { it for it in "aeiouAEIOU" }

def sort_vowels(s) -> str:
    if not (s and type(s) is str):
        # error exit on invalid argument
        return ""
    return "\n".join(map( lambda c: "|"+c if c in VOWELS else c+"|", s))
