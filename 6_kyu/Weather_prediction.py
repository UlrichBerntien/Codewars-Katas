import numpy as np

def weather_prediction(days :int, weather_today :int, final_weather :int, P :list[list[float]]) -> float:
    """
    Weather prediction.
    days -- number of days for prediction, an integer
    weather_today -- ID Code of current weather an integer
    final_weather -- ID Code to predict in n days, an integer
    P -- tranistion matrix, where p_xy is probability going from weather x to y in one day
         [[p_11, ..., p_1k], [p_21, ..., p_2k], ..., [p_k1, ..., p_kk]]
    Return -- probability of fintal_weather
    """
    final_P = np.matrix(P) ** days
    return final_P[weather_today,final_weather]
