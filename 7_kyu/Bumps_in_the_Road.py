def bumps(road: str) -> str:
    bumps = sum(c == "n" for c in road)
    return "Woohoo!" if bumps <= 15 else "Car Dead"