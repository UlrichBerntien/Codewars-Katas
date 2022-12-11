import re

# Pattern matches all arrow types.
# - Double-Sided arrows are included!
# - Mixed tails are not included, only the pure "-" or "=" part of the tail.
# So you can identify the matched string only by first and last char.
ARROWS_PATTERNS=re.compile(r"<([-=]?)\1*>?|([-=]?)\2*>")

# Count arrows in the string.
def arrow_search(string: str) -> int:
    accu = 0
    for match_obj in ARROWS_PATTERNS.finditer(string):
        match = match_obj.group()
        print(match)
        l = len(match)
        if match[0] == "<":
            if l == 1 or match[-1] == "-":
                accu -= l
            elif match[-1] == "=":
                accu -= 2*l
        elif match[-1] == ">":
            if l == 1 or match[0] == "-":
                accu += l
            elif match[0] == "=":
                accu += 2*l
    return accu
