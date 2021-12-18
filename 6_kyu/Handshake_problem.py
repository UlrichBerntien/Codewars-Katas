from math import ceil, sqrt

def get_participants(handshakes):
    return int(ceil(1+sqrt(8*handshakes+1)+1)/2)
