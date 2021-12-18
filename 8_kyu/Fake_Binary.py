# Translation table digits -> fake-bin digits
FAKE_BIN_TRANSLATION = str.maketrans('0123456789','0000011111')

def fake_bin(x: str) -> str:
    return x.translate( FAKE_BIN_TRANSLATION )
