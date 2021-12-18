class Person(object):
    
    def __init__(self, name: str) -> None:
        self._name = name
    
    @property
    def name(self) -> str:
        return self._name
    
    def greet(self, your_name: str) -> str:
        return f"Hello {your_name}, my name is {self.name}"

def greet(my_name: str, your_name: str) -> str:
    my = Person(my_name)
    return my.greet(your_name)
