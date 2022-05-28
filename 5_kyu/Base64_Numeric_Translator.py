from functools import reduce

# Map translates digit character into digit value.
DIGIT_VALUE = dict((c,n) for (n,c) in enumerate("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"))

def base64_to_base10(s: str) -> int:
    return reduce( lambda accu,c: accu*64+DIGIT_VALUE[c], s, 0)
