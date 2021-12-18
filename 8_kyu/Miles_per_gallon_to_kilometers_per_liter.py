# Factor from MPG to KPL
MPG2KPL =  1.609344 / 4.54609188

def converter(mpg):
    return round(mpg * MPG2KPL, 2)