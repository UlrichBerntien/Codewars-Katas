def average_to_binary(n: int) -> set[str]:
    """
    Find all pairs of positive numbers which differ in one bit with average is n.
    Returns the pairs as strings with an x for the bit which is different.
    Except: The string "x..." represents only one number "1..."
    """
    binary = format(n,'b')
    if len(binary) == 1:
        return {binary}
    accu = {"x" + binary[1:]}
    for i in range(1,len(binary)-1):
        if binary[i:i+2] == "10":
            accu.add( binary[:i] + "x1" + binary[i+2:] )
        elif binary[i:i+2] == "01":
            accu.add( binary[:i] + "x0" + binary[i+2:] )
    return accu
