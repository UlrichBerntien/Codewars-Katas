import re

ATE9 = re.compile(r"79(?=7)")

def seven_ate9(s: str) -> str:
    return ATE9.sub("7", s)