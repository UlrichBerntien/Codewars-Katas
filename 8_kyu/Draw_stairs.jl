function drawstairs(n)
  buffer = IOBuffer()
  write(buffer,'I')
  for i in 2:n
    write(buffer,'\n',' '^(i-1),'I')
  end
  return String(take!(buffer))
end