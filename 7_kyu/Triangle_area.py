def t_area(t_str: str) -> float:
    rows = sum(c == '\n' for c in t_str) - 2
    return (rows*rows)/2