def ice_brick_volume(radius: int, bottle_length: int, rim_length: int) -> int:
    if radius < 0 or bottle_length < rim_length:
        return 0
    return 2*radius*radius*(bottle_length-rim_length)