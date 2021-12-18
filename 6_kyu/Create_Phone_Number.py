def create_phone_number(n):
    s = "".join(str(digit) for digit in n)
    return f"({s[:3]}) {s[3:6]}-{s[6:]}"