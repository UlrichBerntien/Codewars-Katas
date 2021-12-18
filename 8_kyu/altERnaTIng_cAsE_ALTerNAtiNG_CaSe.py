def to_alternating_case(string):
    lower = string.lower()
    upper = string.upper()
    return ''.join( upper[it] if string[it].islower() else lower[it] for it in range(len(string)) )