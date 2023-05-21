using Statistics

"Returns arithmetic mean value or 0 if the array is empty."
find_average(array) = isempty(array) ? 0 : mean(array)
