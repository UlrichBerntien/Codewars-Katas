# Translation table to remove spaces
REMOVE_SPACE = str.maketrans("",""," \t")

# Returns the words from str in CamalCaseFormat.
def camel_case(string: str) -> str:
    return string.title().translate(REMOVE_SPACE)