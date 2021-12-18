def split_in_parts(s: str, part_length: int) -> str:
    return " ".join(s[i:i+part_length] for i in range(0,len(s),part_length))
