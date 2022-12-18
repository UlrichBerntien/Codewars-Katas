# Pattern matchs a dog or cat with one prefix word.
search = r"(\S+)\s+(dog|cat)" 

# Pattern to substitute the prefix into "blue".
substitute = r"blue \2"
