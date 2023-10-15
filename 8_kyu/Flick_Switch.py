import typing as typ

def flick_switch(lst :typ.Iterable[str]) -> list[bool]:
    """
    Creates list of booleans controled by strings.
    Boolean value switches if string is 'flick'.
    """
    current = True
    def flicker(s :str) -> bool:
        nonlocal current
        if s == "flick": current = not current
        return current
    return [ flicker(s) for s in lst]
