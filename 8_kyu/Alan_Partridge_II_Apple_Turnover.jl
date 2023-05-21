function apple(x::Any)::String
  value = isa(x,String) ? abs(parse(BigFloat, x)) : BigFloat(abs(x))
  value > sqrt(1000.0) ? "It's hotter than the sun!!" : "Help yourself to a honeycomb Yorkie for the glovebox."
end