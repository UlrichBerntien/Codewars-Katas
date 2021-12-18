# map number to ASCII character only for vowels
VOWELS = dict(map(lambda c: (ord(c),c), "aeiou"))

def is_vow(inp):
    return list(map(lambda d: VOWELS.get(d,d), inp))