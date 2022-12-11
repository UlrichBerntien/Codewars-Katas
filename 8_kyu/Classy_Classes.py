class Person(object):
    """
    Class to hold name (str) and age (int) of a person.
    """
    
    def __init__(self, name: str,age: int):
        self.name = name
        self.age = age
        self.info = f"{name}s age is {age}"
