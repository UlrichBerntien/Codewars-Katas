def same_case(a: str, b: str) -> int: 
    if a.isalpha() and b.isalpha():
        return int( a.isupper() == b.isupper() )
    else:
        return -1