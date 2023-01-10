kata = {}


-- Simple assembler interpreter.
-- Argument:
--    Array of simple assembler instructions.
-- Return:
--    Map "register = value" at program end
kata.simple_assembler = function(program)
  local source = kata.compile(program)
  return load(source)()
end


-- Compiles "simple assembler" program into a Lua function.
-- Returns Lua function source code
kata.compile = function(program)
  local lines = {}     -- lines lua code, key = line number
  local labels = {}    -- if needed label for the line, key = line number
  -- translate simple assembler code into lua instructions
  for nr,code in ipairs(program) do
    local instruction, arg1, arg2, number = code:match("(%a+)%s+([+-]?%w*)%s*([+-]?%w*)")
    if instruction == "mov" then
      if arg2:match("[%+%-%d]%d*") then
        -- mov register constant
        lines[nr] = string.format("reg['%s']=%s\n",arg1,arg2)
      else
        -- mov register register
        lines[nr] = string.format("reg['%s']=reg['%s']\n",arg1,arg2)
      end
    elseif instruction == "inc" then
      -- inc register
      lines[nr] = string.format("reg['%s']=reg['%s']+1\n",arg1,arg1)
    elseif instruction == "dec" then
      -- dec register
      lines[nr] = string.format("reg['%s']=reg['%s']-1\n",arg1,arg1)
    elseif instruction == "jnz" then
      target = nr + tonumber(arg2)
      labels[target] = "LINE_" .. target
      if arg1:match("[%+%-%d]%d*") then
        if tonumber(arg1) ~= 0 then
          -- jnz "constant != 0" line-delta
          lines[nr] = string.format("goto %s\n",labels[target])
        else
          -- jnz 0 line-delta
          lines[nr] = "-- nop\n"
        end 
      else
        -- jnz register line-delta
        lines[nr] = string.format("if reg['%s']~=0 then goto %s end\n",arg1,labels[target])
      end
    else
      print("WARNING: ignore invalid instruction",nr,":",code)
    end
  end
  -- combine all lua code lines into one string
  local source = "reg={}"
  for nr,code in ipairs(lines) do
    if labels[nr] then
      source = source .. "::" .. labels[nr] .. ":: "
    end
    source = source .. code
  end
  -- collect all goto targets behind the last code line
  for nr,label in pairs(labels) do
    if nr > #lines then
      source = source .. "::" .. labels[nr] .. "::\n"
    end
  end
  -- function returns the register set
  source = source .. "return reg\n"
  return source
end

return kata