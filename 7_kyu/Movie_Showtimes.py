# Time between two movies [minutes, range 0-].
MOVIE_PAUSE = 15

# Schedules movie start times
# Arguments:
#   open - time at which the cinema opens entrance [hour, range 0-23]
#   close - time at which the cinema closes entrance [hour, range 0-23]
#   length - length of the movie [minutes, range 1-]
# Return:
#   list of tupels (hour 0-23, minute 0-59) of movie start.
def movie_times(open: int, close: int, length: int) -> list[tuple[int]]:
    # Internal use unit minutes for all time stamps
    open_min = open * 60
    if close <= open:
        # Use time > 23 hour to address time of next day
        close_min = (close+24) * 60
    else:
        close_min = close * 60
    periode_min = length + MOVIE_PAUSE
    start_list = []
    current_start_min = open_min
    # Play movies until close time.
    # The end of the film could be the closing time, the visitors leave the cinema after the closing time.
    while current_start_min + length <= close_min:
        start_list.append( ((current_start_min//60) % 24, current_start_min % 60) )
        current_start_min += periode_min
    return start_list
