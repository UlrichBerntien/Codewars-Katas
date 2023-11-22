def gimme_the_letters(sp: str) -> str:
    """
    Expands a given range of characters.
    E.g. "h-o" ➞ "hijklmno".
    sp -- A string in format "F-L" with F the first and L the last character of the range.
    return -- String with all characters in the range "F-L".
    """
    if not sp or len(sp) != 3 or sp[1] != '-' or sp[0] > sp[2]:
        # invalid argument
        return ""
    return "".join( chr(c) for c in range(ord(sp[0]),ord(sp[2])+1) )
