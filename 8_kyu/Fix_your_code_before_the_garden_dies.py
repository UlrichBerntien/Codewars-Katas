NEED = 40 # mm

def rain_amount(rain_amount: int) -> str:
    give = NEED - rain_amount
    if give > 0:
        return f"You need to give your plant {give}mm of water"
    else:
        return "Your plant has had more than enough water for today!"