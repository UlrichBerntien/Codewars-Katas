class BullsAndCows:
    @staticmethod
    def opts(n: int) -> str:
        return "" if n == 1 else "s"

    @staticmethod
    def prepare_value(n: int) -> str:
        if n < 1023 or n > 9876:
            raise ValueError
        s = str(n)
        for it in s:
            if s.count(it) != 1:
                raise ValueError
        return s

    
    def __init__(self, n: int):
        self.turns = 1
        self.won = False
        self.secret = self.prepare_value(n)
    
    def compare_with(self, n: int) -> str:
        if self.won:
            return "You already won!"
        if self.turns > 8:
            return "Sorry, you're out of turns!"
        test = self.prepare_value(n)
        self.turns += 1
        bulls = 0
        cows = 0
        for idx in range(4):
            if test[idx] == self.secret[idx]:
                bulls += 1
            elif test[idx] in self.secret:
                cows += 1
        if bulls == 4:
            self.won = True
            return "You win!"
        else:
            return f"{bulls} bull{self.opts(bulls)} and {cows} cow{self.opts(cows)}"