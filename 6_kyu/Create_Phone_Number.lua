return {
  -- Format list of numbers like a phone number "(123) 456-7890"
  create_phone_number = function(numbers)
    local number = table.concat(numbers)
    return "(" .. number:sub(1,3) .. ") " .. number:sub(4,6) .. "-" .. number:sub(7)
  end
};
