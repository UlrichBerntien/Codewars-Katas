# Adding list of lists of strings
# Joins the rows to words, joins the word to a string.
def arr_adder(arr: list[list[str]]) -> str:
    rows = len(arr)
    if rows == 0:
        return ""
    cols = len(arr[0])
    return " ".join( ["".join([arr[row][col] for row in range(rows)]) for col in range(cols)] )
