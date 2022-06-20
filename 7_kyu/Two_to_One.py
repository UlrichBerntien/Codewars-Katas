# Merges the characters of two strings.
# Returned strings is sorted of unique characters.
def longest(a1 :str, a2 :str) -> str:
    accu = set(a1)
    accu.update(a2)
    return "".join(sorted(accu))
