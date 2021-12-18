# Dollars per bill
BILL_UNITS = (1,5,10,20,50,100)

def give_change(amount): 
    result = []
    for unit in reversed(BILL_UNITS):
        count = amount // unit
        amount -= count * unit
        result.insert(0,count)
    return tuple(result)