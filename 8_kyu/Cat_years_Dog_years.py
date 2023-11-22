def human_years_cat_years_dog_years(human_years: float) -> list[float,float,float]:
    """
    Calculates cat year and dog years.
    human_year -- standard year count.
    return -- list of human, cat and dog years.
    """
    if human_years <= 1:
        return [human_years, 15*human_years, 15*human_years]
    elif human_years <= 2:
        return [human_years, 15+9*(human_years-1), 15+9*(human_years-1)]
    else:
        return [human_years, 24+4*(human_years-2), 24+5*(human_years-2)]
