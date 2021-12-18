from typing import List

def find_needle(haystack: List[str]) -> str:
    try:
        i = haystack.index("needle")
        return "found the needle at position " + str(i)
    except ValueError:
        return "found no needle"