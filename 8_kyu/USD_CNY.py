# Exchange rate: x CNY are 1 USD.
EXCHANGE_RATE_CNY_USD = 6.75

# Converts value in USD into a string with CNY value.
# Argument
#   usd - value in USD
# Return
#   string - "x.xx Chinese Yuan"
def usdcny(usd: int) -> str:
    cny = EXCHANGE_RATE_CNY_USD * usd
    return f"{cny:.2f} Chinese Yuan"
