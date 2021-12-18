import re

def hydrate(drink_string):
    drinks = sum( int(num) for num in re.findall("\d+",drink_string) )
    return f"{drinks} glass{'es' if drinks>1 else ''} of water"
    