from typing import List

def solve(s: str) -> List[int]:
    uppercase = 0
    lowercase = 0
    numbers = 0
    special = 0
    for c in s:
        if c.isdigit():
            numbers += 1
        elif c.isupper():
            uppercase += 1
        elif c.islower():
            lowercase += 1
        else:
            special += 1
    return [uppercase,lowercase,numbers,special]