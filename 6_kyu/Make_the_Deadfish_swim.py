def parse(data):
    value = 0
    output = []
    for command in data:
        if command == "i":
            value += 1
        elif command == "d":
            value -= 1
        elif command == "s":
            value *= value
        elif command == "o":
            output.append(value)
        # ignore invalid command
    return output