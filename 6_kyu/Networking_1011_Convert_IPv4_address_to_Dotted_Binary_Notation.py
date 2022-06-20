# Convert decimal IPv4 string into binary IPv4 string.
def ipv4_to_binary(ipv4_addr: str) -> str:
    bins = [f"{int(it):08b}" for it in ipv4_addr.split(".")]
    return ".".join(bins)