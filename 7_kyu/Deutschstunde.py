# Translation table removes all german vowels.
REMOVE_VOWELS = str.maketrans("","","aeiouAEIOUäöüÄÖÜ")

# Count german vowels in wort and returns:
#   count < 2       : "der wort"
#   2 <= count <= 3 : "die wort"
#   3 < count       : "das wort"
def der_die_das(wort):
    count_vowels = len(wort) - len(wort.translate(REMOVE_VOWELS))
    if count_vowels < 2:
        article = "das"
    elif count_vowels <= 3:
        article = "die"
    else:
        article = "der"
    return article + " " + wort
