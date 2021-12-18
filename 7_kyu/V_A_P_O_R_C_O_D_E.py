def vaporcode(s: str) -> str:
    return "  ".join(c for c in s.upper() if not c.isspace())