import re

def parse_IPv6(iPv6):
    convert = lambda n: str(sum( int(c,base=16) for c in n ))
    return "".join(map(convert,re.split(r"[^0-9a-fA-F]",iPv6)))