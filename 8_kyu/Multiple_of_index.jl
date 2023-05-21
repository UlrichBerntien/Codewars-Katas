# Filter lets pass items that are multiples of their index in the array.
function multipleofindex(arr::Array{Int,1})
  arr[[arr[i]%i == 0 for i = 1:length(arr)]]
end
