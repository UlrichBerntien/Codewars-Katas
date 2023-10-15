def best_friend(txt: str, a :str, b :str) -> bool:
    """
    Returns True if in txt after char a is the char b
    """
    snd = False # second character must follow
    for c in txt:
        if snd:
            if b != c: return False
            snd = False
        # no elfi because the second char could be also the first char if a==b
        if a == c:
            snd = True
    return not snd
