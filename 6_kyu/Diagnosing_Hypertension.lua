local kata = {}

-- Parse dataset of string in format "number/number".
-- Returns two tables with all first/second numbers.
kata.parseDataset = function(datastrings)
  local firstArray = {}
  local secondArray = {}
  for _,s in ipairs(datastrings) do
    local first, second
    _,_,first,second = s:find("(%d+)/(%d+)")
    if first ~= nil and second ~= nil then
      table.insert(firstArray, tonumber(first))
      table.insert(secondArray, tonumber(second))
    end
  end
  return firstArray, secondArray
end

-- Calculates arithmetic mean value of all numbers.
kata.mean = function(numbers)
  if #numbers == 0 then
    return nil
  end
  local sum = 0
  for _,v in ipairs(numbers) do
    sum = sum + v
  end
  print("mean=",sum/#numbers)
  return sum/#numbers
end

-- Checks if the patient is hypertensic.
-- dataset is the table of measurements "systolics/diastolics".
kata.isHypertensice = function(dataset)
  local systolics, diastolics = kata.parseDataset(dataset)
  -- check for single value above limits
  for i = 1,#systolics do
    if systolics[i] >= 180 and diastolics[i] >= 110 then
      return true
    end
  end
  if #systolics >= 2 then
    -- analyze mean values only if at least two values are given
    if kata.mean(systolics) >= 140 or kata.mean(diastolics) >= 90 then
      return true
    end
  end
  return false
end

-- Counts number of patients with hypertension.
-- patients is a table of the measurements of all patients.
kata.hypertensive = function(patients)
  local count = 0
  for i, dataset in ipairs(patients) do
    if kata.isHypertensice(dataset) then
      count = count + 1
    end
  end
  return count
end

return kata
