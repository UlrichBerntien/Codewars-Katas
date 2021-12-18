def get_number_from_string(string: str) -> int:
    accu = 0
    for c in string:
        if '0' <= c <= '9':
            accu = ord(c) - ord('0') + accu*10
    return accu