def rental_car_cost(d: int) -> int:
    # base: $40 per day
    cost = 40 * d;
    if d >= 7:
        # more then 7 day: $50 discount
        cost -= 50
    elif d >= 3:
        # more then 3 day: $20 discount
        cost -= 20
    return cost