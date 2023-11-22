def update_light(current: str) -> str:
    """
    Returns the next traffic light color.
    """
    return TRAFFIC_LIGHTS[(TRAFFIC_LIGHTS.index(current)+1) % len(TRAFFIC_LIGHTS)]

# List of all traffic light colors.
# Order in the tuple is the time sequence of the signales.
TRAFFIC_LIGHTS = ("green","yellow","red")
