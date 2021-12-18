def filter_long_words(sentence, n):
    return list(filter(lambda s: len(s) > n, sentence.split()))
