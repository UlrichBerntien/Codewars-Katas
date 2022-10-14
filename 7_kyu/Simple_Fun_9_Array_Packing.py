from collections.abc import Iterable

# Generates in from list of bytes.
# Bytes are in little endian order.
def array_packing(arr: Iterable[int]) -> int:
    return int.from_bytes(arr,"little")
