def abbrev_name(name: str) -> str:
    """
    Returns the string name abbreviated.
    Returns the first letter of each name part in upper case separated by a dot.
    """
    return ".".join(s[0] for s in name.split()).upper()
