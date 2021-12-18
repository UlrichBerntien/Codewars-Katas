# Dictionary lower case letter to position in the alphabet
LOWCHAR2POS = dict( (chr(i-1+ord("a")),str(i)) for i in range(1,27) )

def alphabet_position(text: str) -> str:
    return " ".join(LOWCHAR2POS[c] for c in text.lower() if c in LOWCHAR2POS)
