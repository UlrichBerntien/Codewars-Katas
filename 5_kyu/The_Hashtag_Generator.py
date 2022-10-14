# String translation table to remove spaces and tabs.
REMOVE_SPACE_TRANSLATE = str.maketrans( "", "", " \t")

# Generates hashtag out of string.
# Returns False if no valid hashtag could be generated.
def generate_hashtag(s: str) -> str|bool:
    hash = "#" + s.title().translate(REMOVE_SPACE_TRANSLATE)
    return hash if 1 < len(hash) <= 140 else False
