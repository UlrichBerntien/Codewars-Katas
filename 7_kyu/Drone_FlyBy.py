def fly_by(lamps: str, drone: str) -> str:
    len_on = min(len(drone),len(lamps))
    return "o"*len_on + lamps[len_on:]