def update_inventory(cur_stock: list, new_stock: list) -> list:
    """
    Updates inventory list.
    Inventory is stored as list of tuples (count, name).
    The list is ordered by the name.
    :param cur_stock: The current inventory.
    :param new_stock: The items to add to the inventory.
    :return: The new iventory.
    """
    stock = dict((name,count) for (count,name) in cur_stock)
    for count, name in new_stock:
        stock[name] = stock.get(name,0) + count
    return [ (count,name) for (name,count) in sorted(stock.items()) ]