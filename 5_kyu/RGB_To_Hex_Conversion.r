# Converts RGB values to hexstring  
rgb <- function(r, g, b) sprintf("%02X%02X%02X",clamp(r),clamp(g),clamp(b))

# Clamp value x t orange 0..255.
clamp <- function(x) max(0,min(x,255))
