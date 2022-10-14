import re
from collections.abc import Iterable

# Pattern matching all smilry faves.
SMILEY_FACE_PATTERN = re.compile(r"[:;][-~]?[\)D]")

# Count the smily faces in the arr.
# One item in arr can contain one face.
def count_smileys(arr: Iterable[str]) -> int:
    return sum(SMILEY_FACE_PATTERN.fullmatch(it) != None for it in arr)
