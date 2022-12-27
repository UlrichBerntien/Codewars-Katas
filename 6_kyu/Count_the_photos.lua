local solution = {}

-- Count photos taken on a street with cars to left ">", cars to right "<" and cameras ".".
function solution.count_photos(road)
  local cameras_left = 0
  local cars_to_right = 0
  local photos = 0
  for i = 1,#road do
    local c = road:sub(i,i)
    if c == ">" then
      cars_to_right = cars_to_right + 1
    elseif c == "<" then
      photos = photos + cameras_left
    elseif c == "." then
      photos = photos + cars_to_right
      cameras_left = cameras_left + 1
    end
  end
  return photos
end

return solution
