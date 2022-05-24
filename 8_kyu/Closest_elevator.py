def elevator(left: int, right: int, call: int) -> str:
    return "left" if abs(left-call) < abs(right-call) else "right"