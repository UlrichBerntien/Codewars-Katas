# Translation table
# all left char -> "q"
# all right chars -> "y"
LEFT_RIGHT_TABLE = str.maketrans(
    "qwertasdfgzxcvbQWERTASDFGZXCVByuiophjklnmYUIOPHJKLNM",
    "qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqyyyyyyyyyyyyyyyyyyyyyy" )

def comfortable_word(word: str) -> bool:
    lr = word.translate(LEFT_RIGHT_TABLE)
    return all( lr[i] != lr[i+1] for i in range(len(lr)-1) )