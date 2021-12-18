def array(string: str) -> str:
    splits = string.split(",")[1:-1]
    if splits:
        return " ".join( it.strip() for it in splits )
    else:
        return None