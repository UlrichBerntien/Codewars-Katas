def weather_info (fahrenheit: float) -> str:
    celsius = convertToCelsius(fahrenheit)
    if celsius > 0:
        return f"{celsius} is above freezing temperature"
    else:
        return f"{celsius} is freezing temperature"


def convertToCelsius (fahrenheit: float) -> float:
    return (fahrenheit - 32) * (5/9)
