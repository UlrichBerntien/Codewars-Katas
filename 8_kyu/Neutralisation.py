def neutralise(s1 :str, s2 :str) -> str:
    """
    Merges two strings, returns a string of equal characters and "0" at positions of different characters.
    s1 -- first string to merge
    s2 -- second string to merge
    Return -- string with equal chars of s1 and s2 and "0" where chars not equal.
    """
    return "".join( c[0] if c[0]==c[1] else "0" for c in zip(s1,s2) )
