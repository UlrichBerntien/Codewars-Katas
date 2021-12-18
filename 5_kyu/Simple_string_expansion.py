import re
import typing

EXPANSION_PATTERN = re.compile(r"(\d*)\(([^()]*)\)")

def solve(st: str) -> str:
    def expand(match: typing.Match) -> str:
        if match.group(1):
            return match.group(2)*int(match.group(1))
        else:
            return match.group(2)
    old = None
    while old != st:
        old = st
        st = EXPANSION_PATTERN.sub(expand,st)
    return st