def vowel_change(txt, vow):
    vowels = "aeiou"
    return txt.translate( str.maketrans(vowels,vow*len(vowels)) )