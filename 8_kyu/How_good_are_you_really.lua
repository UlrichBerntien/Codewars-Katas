return {
  -- Compares your_points relative to arithmetic mean of class_points.
  -- Returns true if your_points is above the mean of class_points, else returns false.
  better_than_average = function(class_points, your_points)
    local sum = 0
    for _,v in ipairs(class_points) do
      sum = sum + v
    end
    return sum < your_points * #class_points
  end
  }