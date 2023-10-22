def get_planet_name(id: int) -> str:
    """
    Returns planet name by palnet id (1,2..8)
    """
    return ("Sun","Mercury","Venus","Earth","Mars","Jupiter","Saturn","Uranus","Neptune","Pluto")[id]
