# Hash map greek alphabet name -> index in the alphabet
GREEK_ALPAHBET_MAP = dict( zip(greek_alphabet,range(len(greek_alphabet))) )

def greek_comparator(lhs: str, rhs: str) -> int:
    return GREEK_ALPAHBET_MAP[lhs] - GREEK_ALPAHBET_MAP[rhs]