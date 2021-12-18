def reverse_letter(string: str) -> str:
    return ''.join(filter(str.isalpha,string))[::-1]
    