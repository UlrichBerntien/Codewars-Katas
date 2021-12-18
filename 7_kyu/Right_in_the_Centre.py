def is_in_middle(sequence: str) -> bool:
    SEQ="abc"
    if len(sequence) < len(SEQ):
        return False
    start,d = divmod(len(sequence)-len(SEQ), 2)
    return sequence[start:start+len(SEQ)] == SEQ or sequence[start+d:start+d+len(SEQ)] == SEQ
