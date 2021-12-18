def remove(s: str) -> str:
    return s[:-1] if s and s[-1] == '!' else s