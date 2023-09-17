def string_task(s: str) -> str:
    def transform(c: str) -> str:
        if c in ( "a", "o", "y", "e", "u", "i"):
            return ""
        else:
            return "."+c
    return "".join(map(transform,s.lower()))