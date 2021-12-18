def solution(number):
    def gauss(last):
        return (last*(last+1))//2
    nm = number -1
    return 3*gauss(nm//3) + 5*gauss(nm//5) - 15*gauss(nm//15)