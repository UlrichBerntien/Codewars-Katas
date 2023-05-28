"""
  Creates a matrix of size x size.
  The items in the matrix are the product of row and column index.
"""
function multiplicationtable(size::Int64)::Matrix{Int64}
 a = [i for i in 1:size]
 a * a'
end
