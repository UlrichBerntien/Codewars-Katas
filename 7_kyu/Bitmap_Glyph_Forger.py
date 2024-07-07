def hex_to_bitmap(hex_input: str) -> str:
    """
    Returns the hex number converted into a binary number, one byte per row.
    """
    # hex number into binary number with all leading zeros
    binary = format(int(hex_input,16),f"0{len(hex_input)*4}b")
    # one byte per line
    formated = "\n".join(binary[i:i+8] for i in range(0,len(binary),8)) + "\n"
    return formated
