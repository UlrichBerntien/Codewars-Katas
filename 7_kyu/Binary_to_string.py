def binary_to_string(binary: str) -> str:
    return bytes( int(b,2) for b in binary.split("0b") if b != '' ).decode('ascii')
                    