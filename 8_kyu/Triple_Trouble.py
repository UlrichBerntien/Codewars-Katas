# Merges the 3 strings char by char.
def triple_trouble(one: str, two: str, three: str) -> str:
    input = (one,two,three)
    common_len = min(len(s) for s in input)
    return "".join("".join(s[i] for s in input) for i in range(common_len))
