# Value of a character in the VIN.
# A character not in the map is an invalid character.
VIN_VALUE = {
    "0": 0, "1": 1, "2": 2, "3": 3, "4": 4, "5": 5,
    "6": 6, "7": 7, "8": 8, "9": 9, "A": 1, "B": 2,
    "C": 3, "D": 4, "E": 5, "F": 6, "G": 7, "H": 8, 
    "J": 1, "K": 2, "L": 3, "M": 4, "N": 5, "P": 7,
    "R": 9, "S": 2, "T": 3, "U": 4, "V": 5, "W": 6,
    "X": 7, "Y": 8, "Z": 9
}

# Weight of position in the VIN.
VIN_WEIGHT = (8,7,6,5,4,3,2,10,0,9,8,7,6,5,4,3,2)

# Check character at 9th position in the VIN.
VIN_CHECK = "0123456789X"

def check_vin(number: str) -> bool:
    """
    Checks a VIN.
    Return true if and only if the number is valid VIN.
    """
    if type(number) is not str or len(number) != 17:
        return False
    try:
        s = sum( VIN_VALUE[number[i]]*VIN_WEIGHT[i] for i in range(17) )
        return VIN_CHECK[s % 11] == number[8]
    except KeyError:
        return False
