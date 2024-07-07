import collections as col

# Number of duplicate characters in the argument text.
# The detection of duplicates is case-insensitive.
def duplicate_count(text: str) -> int:
    char_counts = col.Counter(text.casefold())
    return sum( i>1 for _,i in char_counts.items() )