def dashatize(num):
    if not isinstance(num,int):
        return "None"
    if num == 0:
        return '0'
    elif num < 0:
        num = -num
    NULL = ord('0')
    buffer = []
    while num > 0:
        num,m = divmod(num,10)
        if m & 1 == 1:
            if buffer and buffer[0] != '-':
                buffer.insert(0,'-')
            buffer.insert(0,chr(m+NULL))
            buffer.insert(0,'-')
        else:
            buffer.insert(0,chr(m+NULL))
    if buffer[0] == '-':
        del(buffer[0])
    return ''.join(buffer)