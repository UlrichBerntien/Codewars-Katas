# Static translation tables
ENCODE_TABLE = str.maketrans("aeiou", "12345")
DECODE_TABLE = str.maketrans("12345", "aeiou")

def encode(st):
    return st.translate(ENCODE_TABLE)
    
def decode(st):
    return st.translate(DECODE_TABLE)