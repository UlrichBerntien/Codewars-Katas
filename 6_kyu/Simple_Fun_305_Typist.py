def typist(s: str) -> int:
    low_mode = True
    hits = len(s)
    for c in s:
        if low_mode != c.islower():
            hits += 1
            low_mode = not low_mode
    return hits
        