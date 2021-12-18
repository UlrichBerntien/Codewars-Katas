"""
  product(values)
  
Returns product of all numbers in a numeric array.
Returns nothing if param is nothing or array is empty.  
"""
function product(values)
    values == nothing || isempty(values) ? nothing : reduce(*,values)
end