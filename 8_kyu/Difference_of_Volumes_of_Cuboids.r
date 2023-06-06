# Returns the difference between the volumes of cuboids a and b.
# Each vectors contains the lengths of the cuboid sides.
find_difference <- function(a, b) abs(prod(a) - prod(b))
