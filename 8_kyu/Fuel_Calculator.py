# Calculates the fuel cost with purchase.
def fuel_price(litres, price_per_litre):
    # Purchase 5 cent per 2 liters up to 25 cents
    purchase = 5 * (litres // 2 )
    if purchase > 25:
        purchase = 25
    return round(litres * ( price_per_litre - purchase/100 ), 2 )
