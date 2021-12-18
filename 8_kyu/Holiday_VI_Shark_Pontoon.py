def shark(pontoon_distance: float, shark_distance: float, you_speed: float, shark_speed: float, dolphin: bool) -> str:
    shark_time = shark_distance / shark_speed
    if dolphin:
        shark_time *= 2
    swim_time = pontoon_distance / you_speed
    return "Alive!" if swim_time <= shark_time else "Shark Bait!"
    