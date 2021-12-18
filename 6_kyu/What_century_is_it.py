def what_century(year):
    def get_ext(n):
        last_digit = n % 10
        if 20 > n > 10 or not 4 > last_digit > 0:
            return 'th'
        else:
            return ('st','nd','rd')[last_digit-1]
    century = (int(year)+99) // 100
    return f"{century}{get_ext(century)}"