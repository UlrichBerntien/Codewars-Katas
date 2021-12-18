import ipaddress

def int32_to_ip(int32: int) -> str:
    return ipaddress.IPv4Address(int32).exploded