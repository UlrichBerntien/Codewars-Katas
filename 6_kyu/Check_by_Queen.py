def check(board):
    """
    Returns True if the king (k) is in chess from queen (q) on the board.
    """
    qposition = pos(board,'q')
    kposition = pos(board,'k')
    return (qposition[0] == kposition[0] or
        qposition[1] == kposition[1] or
        abs(qposition[0]-kposition[0]) == abs(qposition[1]-kposition[1]))

def pos(board,stone):
    """
    Returns position (x,y) of stone on the board.
    """
    for x,row in enumerate(board):
        for y,field in enumerate(row):
            if field == stone:
                return x,y
    return None
