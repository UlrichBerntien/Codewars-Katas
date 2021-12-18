def strings_in_max_depth(s):
    current_level = 0
    current_start = 0
    max_level = 0
    accu = [s]
    for i,c in enumerate(s):
        if c == "(":
            current_level += 1
            current_start = i+1
        elif c == ")":
            if current_level > max_level:
                max_level = current_level
                accu = [s[current_start:i]]
            elif current_level == max_level:
                accu.append(s[current_start:i])
            current_level -= 1
    return accu