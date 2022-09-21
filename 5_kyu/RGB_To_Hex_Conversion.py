# Clamp number to 8-bit range 0..255
def clamp8(x: int) -> int:
    if x < 0:
        return 0
    if x > 255:
        return 255
    return x

# Generates RGB color string with hex digits.
# Limits the channels to 0..255
def rgb(r :int, g :int, b :int) -> str:
    return f"{clamp8(r):02X}{clamp8(g):02X}{clamp8(b):02X}"
