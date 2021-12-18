def to_csv_text(array):
    return "\n".join( ",".join(map(str,row)) for row in array )
