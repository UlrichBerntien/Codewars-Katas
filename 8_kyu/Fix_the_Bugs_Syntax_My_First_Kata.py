def my_first_kata(a, b):
    if not a or not b or type(a) is not int or type(b) is not int:
        return False
    return a % b + b % a
