class Guesser:
    def __init__(self, number, lives):
        self.number = number
        self.lives = lives
  
    def guess(self,n):
        if self.lives < 1:
            raise Exception("Omae wa mo shindeiru")
        match = n == self.number
        if not match:
            self.lives -= 1
        return match