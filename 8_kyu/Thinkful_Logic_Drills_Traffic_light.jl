"""
  Returns the next traffic light color.
"""
function updatelight(current::String)::String
  i = findfirst(it -> it == current, TRAFFIC_LIGHT_COLORS)
  # Return "red" as error fallback
  TRAFFIC_LIGHT_COLORS[i == nothing ? 3 : (i%length(TRAFFIC_LIGHT_COLORS)+1)]
end

# List of all traffic light colors.
# Order in the tuple is the time sequence of the signales.
const TRAFFIC_LIGHT_COLORS = ("green","yellow","red")
