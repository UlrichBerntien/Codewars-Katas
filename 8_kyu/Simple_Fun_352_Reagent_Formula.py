def isValid(formula: list[int]) -> bool:
    f = sum( 1<<bit for bit in formula )
    return (
        f & 0b110 != 0b110 and
        f & 0b11000 != 0b11000 and
        (bit(f,1<<5) == bit(f,1<<6)) and
        (bit(f,1<<7) or bit(f,1<<8)) )
    
def bit(x: int, mask: int) -> bool:
    return x & mask != 0
