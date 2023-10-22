def guess_blue(blue_start :int, red_start :int, blue_pulled :int, red_pulled :int) -> float:
    blue_remain = blue_start - blue_pulled;
    total_remain = blue_remain + red_start - red_pulled;
    return blue_remain / total_remain if total_remain > 0 else 0.
