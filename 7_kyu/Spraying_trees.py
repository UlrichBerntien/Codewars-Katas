from typing import Union

# Worker name per weekday name
WORKER_BY_WEEKDAY = {
    "Monday"   : "James",
    "Tuesday"  : "John",
    "Wednesday": "Robert",
    "Thursday" : "Michael",
    "Friday"   : "William"
}

def task(weekday: str, number: int, cost: Union[int,float]) -> str:
    name = WORKER_BY_WEEKDAY[weekday]
    x = cost * number
    return f"It is {weekday} today, {name}, you have to work, you must spray {number} trees and you need {x} dollars to buy liquid"
