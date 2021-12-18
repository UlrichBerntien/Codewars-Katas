import numpy

NEEDED = (100, 75, 50)

def death_star(week, attack): 
    arrived = numpy.sum(week[:attack],axis=0)
    delta = numpy.subtract(NEEDED,arrived)
    if all(delta <= 0):
        return "The station is completed!"
    else:
        missing = numpy.amax((delta,(0,0,0)),axis=0)
        return f"The station is destroyed! It needed {missing[0]} iron, {missing[1]} steel and {missing[2]} chromium for completion."
