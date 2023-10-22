import typing as typ

def goose_filter(birds: typ.Iterable[str]) -> list[str]:
    """"
    Returns the array birds filtered out the geese.
    """
    return [s for s in birds if s not in geese]

# Set of valuse to filter out.
geese = { "African", "Roman Tufted", "Toulouse", "Pilgrim", "Steinbacher" }
