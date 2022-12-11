class Cube(object):
    # This cube needs help
    # Define a constructor which takes one integer, or handles no args
    
    def __init__(self, sidelength = 0):
        """Initialises the cude with the given side length."""
        if sidelength < 0:
            sidelength = -sidelength
        self.__side = sidelength
    
    def get_side(self):
        """Return the side of the Cube"""
        return self.__side

    def set_side(self, new_side):
        """Set the value of the Cube's side."""
        if new_side < 0:
            new_side = -new_side
        self.__side = new_side
