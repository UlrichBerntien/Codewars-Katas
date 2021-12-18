import re

SEPARATOR = re.compile(r"[,;&|*+#<>:!=?%]")

def word_splitter(string1):
    return SEPARATOR.split(string1)