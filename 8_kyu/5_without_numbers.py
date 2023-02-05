# Returns integer five without using the digit five in the code.
def unusual_five():
    return len(bytes("fünf","utf"))
