module Solution
  export areaOrPerimeter
  function areaOrPerimeter(l::T, w::T)::T where T<:Number
      l == w ? l*w : 2*(l+w)
  end
end