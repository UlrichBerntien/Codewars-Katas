# Checks for isograms.
# An isogram is a word in which each letter occurs only once.
# Returns True if the word is an isogram.
def is_isogram(word :str) -> bool:
    w = word.casefold()
    return len(w) == len(set(w))