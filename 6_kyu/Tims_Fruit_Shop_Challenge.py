import re
import typing as typ


def fruit_pack(orders :typ.Iterable[str]) -> list[list[str,str,str]]:
    """
    Converts a list of orders into a list of packed shelfs.
    """
    return [fruit_order_pack(order) for order in orders]


def fruit_order_pack(order :str) -> list[str,str,str]:
    """
    Converts one order into one filled shelf.
    order -- string with fruit orders without separators, like "10a43w".
    shelf -- list of 3 strings displaying the bags, boxes á 10, pallets á 50 fruits
    """
    pallets = ""
    boxes = ""
    bags = ""
    for count, fruit in fruit_order_decoded(order):
        p = count // 50
        b = (count % 50) // 10
        s = count % 10
        if p > 0: pallets += ("[" + fruit + "]") * p
        if b > 0: boxes += ("{" + fruit + "}")  * b
        if s > 0: bags += "(" + fruit*s + ")"
    shelf = (bags, boxes, pallets)
    shelf_width = max(len(board) for board in shelf)
    return [board.rjust(shelf_width,'-') for board in shelf]


def fruit_order_decoded(order :str) -> list[tuple[int,str]]:
    """
    Parses a string of orders.
    Same fruits ordered several times in the string are not combined.
    order -- string with fruit orders without separators, like "10a43w".
    return -- one tuple (count, fruit ID) per ordered fruit.
    """
    return [ (int(m[1]), m[2]) for m in FRUIT_ORDER_FORMAT.finditer(order) ]


# Format of order one fruit
# Count of fruits followed by fruit ID letter.
FRUIT_ORDER_FORMAT = re.compile(r"(\d+)([a-z])")
