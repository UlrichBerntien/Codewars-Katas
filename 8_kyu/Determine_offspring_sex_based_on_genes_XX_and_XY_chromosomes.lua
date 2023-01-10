function chromosomeCheck(sperm)
  if sperm:match("Y") then
    return "Congratulations! You're going to have a son."
  else
    return "Congratulations! You're going to have a daughter."
  end
end

return chromosomeCheck