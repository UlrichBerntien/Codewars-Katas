def quicksum(packet: str) -> int:
    """
    Returns the "Quicksum" checksum value for packet.
    Returns 0 on invalid character (not upper letter and not space) in packet.
    """
    # constant charset index values
    ord_space = ord(' ')
    ord_a = ord('A')
    ord_z = ord('Z')
    # this implementation needs character set ordered A..Z (e.g. ASCII but not EBCDIC)
    assert ord_z-ord_a == 25
    # offset between ord character and value in sum
    offset = ord_a-1
    # sum
    accu = 0
    for i,c in enumerate(packet):
        ord_c = ord(c)
        if ord_a <= ord_c <= ord_z:
            accu += (i+1)*(ord_c-offset)
        elif ord_c != ord_space:
            # quick exit if character is invalid
            return 0
    return accu
