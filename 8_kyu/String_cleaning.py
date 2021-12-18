def string_clean(s):
    """
    Function will return the cleaned string
    """
    return s.translate( s.maketrans("","","0123456789") )