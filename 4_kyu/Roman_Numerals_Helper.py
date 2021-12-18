class RomanNumerals:
    
    __ROMAN_NUMBER_LIST = (
        (1000,'M'),
        ( 900,'CM'), (500,'D'),(400,'CD'),(100,'C'),
        (  90,'XC'), ( 50,'L'),( 40,'XL'),( 10,'X'),
        (   9,'IX'), (  5,'V'),(  4,'IV'),(  1,'I') )
    
    __ROMAN_DIGIT_DICT = {
        'M' : 1000,
        'D' :  500, 'C' : 100,
        'L' :   50, 'X' :  10,
        'V' :    5, 'I' :   1
    }
    
    @staticmethod
    def to_roman(n: int) -> str:
        roman = ''
        for value,code in RomanNumerals.__ROMAN_NUMBER_LIST:
            rest = n - value
            while rest >= 0:
                roman += code
                n = rest
                rest = n - value
        return roman

    @staticmethod
    def from_roman(roman: str) -> int:
        accu = 0
        last_value = 0
        try:
            for c in reversed(roman):
                value = RomanNumerals.__ROMAN_DIGIT_DICT[c]
                if value < last_value:
                    accu -= value
                else:
                    accu += value
                last_value = value
        except KeyError:
            raise ValueError("invalid roman number")
        return accu
    