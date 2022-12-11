# Basis subclasses

class Human(object):
    def __init__(self, name: str):
        self.name = name

class Man(Human):
    pass
    
class Woman(Human):
    pass
    
def God():
    return Man("Adam"), Woman("Eve")
