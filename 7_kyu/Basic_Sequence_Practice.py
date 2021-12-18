from typing import Generator, List

def sum_of_n(n: int) -> List[int]:
    def sum_of_n_gen(n: int) -> Generator[int,None,None]:
        accu = 0
        step = +1 if n>0 else -1
        for i in range(0, n+step, step):
            accu += i
            yield accu
    return list(sum_of_n_gen(n))