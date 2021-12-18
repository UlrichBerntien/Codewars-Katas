CAR_SIZE_SURCHARGE = {"economy":0, "medium":10, "full-size":15}

def insurance(age :int, size :str, num_of_days :int) -> int:
    daily = 50
    if age < 25:
        daily += 10
    daily += CAR_SIZE_SURCHARGE.get(size,15)
    total = daily * num_of_days
    return max(0,total)