def to_time(seconds):
    h,m = divmod(seconds//60, 60)
    return f'{h} hour(s) and {m} minute(s)'