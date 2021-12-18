VOWELS = { c for c in "aeouiAEOUI" }

def swap_vowel_case_char(c :str) -> str:
    return c.swapcase() if c in VOWELS else c

def swap_vowel_case(st: str) -> str: 
    return "".join(swap_vowel_case_char(c) for c in st)
