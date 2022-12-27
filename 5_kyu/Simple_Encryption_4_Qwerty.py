# Regions of the characters.
# Decimal digits of the encryption key are rotation steps in each region.
REGIONS_LOWER = ("zxcvbnm,.", "asdfghjkl", "qwertyuiop")
REGIONS_UPPER = ("ZXCVBNM<>", "ASDFGHJKL", "QWERTYUIOP")

# Rotates text by n characters.
def rotate(text: str, n: int) -> str:
    n %= len(text)
    return text[n:] + text[:n]

# Splits number n into three decimals.
def three_decimals(n: int) -> list[int]:
    accu = [0,0,0]
    for i in range(3):
        accu[i] = n % 10
        n //= 10
    return accu

# Generates encryption table plain text, code text.
def make_encryption(encryptKey: int) -> tuple[str, str]:
    shifts = three_decimals(encryptKey)
    plain =  "".join(REGIONS_LOWER)
    plain += "".join(REGIONS_UPPER)
    code =  "".join(rotate(s,shifts[i]) for i,s in enumerate(REGIONS_LOWER))
    code += "".join(rotate(s,shifts[i]) for i,s in enumerate(REGIONS_UPPER))
    return plain, code

# Encryptes text with encryptKey.
def encrypt(text: str, encryptKey: int) -> str:
    plain, code = make_encryption(encryptKey)
    plain2code = str.maketrans(plain,code)
    return text.translate(plain2code)
    
# Decryptes text with encryptKey.
def decrypt(text: str, encryptKey: int) -> str:
    plain, code = make_encryption(encryptKey)
    code2plain = str.maketrans(code,plain)
    return text.translate(code2plain)
