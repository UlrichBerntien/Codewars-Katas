def extract_bits(field: int, offset: int, length: int) -> int:
    """
    Returns the bits of field at offset with length.
    """
    return (field >> offset) & ((1 << length) - 1)