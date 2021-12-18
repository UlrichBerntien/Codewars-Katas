def remove_bmw(string):
    if isinstance(string,str):
        return string.translate( str.maketrans("","","BMWbmw") )
    else:
        raise TypeError("This program only works for text.")