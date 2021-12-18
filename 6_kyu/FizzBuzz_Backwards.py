def reverse_fizz_buzz(array):
    name = ("FizzBuzz","Fizz","Buzz")
    idx = [0,0,0]
    for i in range(3):
        try:
            idx[i] = array.index(name[i])+1
        except ValueError:
            idx[i] = idx[0]
    return idx[1],idx[2]