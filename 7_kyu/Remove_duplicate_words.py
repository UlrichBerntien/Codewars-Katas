def remove_duplicate_words(s: str) -> str:
    seen = set()
    def was_seen(x:str) -> bool:
        nonlocal seen
        if not (result := x in seen):
            seen.add(x)
        return result
    return " ".join( it for it in s.split() if not was_seen(it) )