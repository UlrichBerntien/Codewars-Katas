def warn_the_sheep(queue):
    number = len(queue)-1-queue.index("wolf")
    if number == 0:
        return "Pls go away and stop eating my sheep"
    else:
        return f"Oi! Sheep number {number}! You are about to be eaten by a wolf!"
