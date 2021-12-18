def flip_bit(value: int, bit_index: int) -> int:
    return value ^ 1 << bit_index-1