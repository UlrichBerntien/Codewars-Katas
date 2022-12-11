from collections.abc import Iterable

# Determin the last position of the ball.
# Arguments:
#   b - start position of the ball
#   arr - list of position swaps
def cup_and_balls(b: int, arr: Iterable[list[int]|tuple[int]]) -> int:
    current = b
    for (swap_a,swap_b) in arr:
        if swap_a == current:
            current = swap_b
        elif swap_b == current:
            current = swap_a
    return current
