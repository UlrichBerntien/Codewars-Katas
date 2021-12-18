def fillable(stock: dict, merch: str, n: int) -> bool:
    return merch in stock and stock[merch] >= n