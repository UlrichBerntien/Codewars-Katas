def valid_ISBN10(isbn: str) -> bool: 
    if not (type(isbn) is str and len(isbn) == 10 and isbn[:9].isdigit()):
        return False
    checksum = 0
    for idx in range(9):
        checksum += int(isbn[idx]) * (idx+1)
    checksum %= 11
    checkchar = str(checksum) if checksum < 10 else 'X'
    return isbn[9] == checkchar