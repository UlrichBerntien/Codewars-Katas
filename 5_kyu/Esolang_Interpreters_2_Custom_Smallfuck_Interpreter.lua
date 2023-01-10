-- Convert smallfuck code into lua code.
local function smallfuck2lua(code,tape)
  -- Convert tape
  program = "local tape={ "
  for t in tape:gmatch("[01]") do
    if t == "1" then
      program = program .. "true,"
    else
      program = program .. "false,"
    end
  end
  program = program:sub(1,#program-1) .. "}\n"
  -- Convert code
  program = program.."local i = 1\n"
  for step in code:gmatch(".") do
    if step == ">" then
      program = program.."i=i+1; if i>#tape then return tape end\n"
    elseif step == "<" then
      program = program.."i=i-1; if i<1 then return tape end\n"
    elseif step == "*" then
      program = program.."tape[i]=not tape[i]\n"
    elseif step == "[" then
      program = program.."while tape[i]==true do\n"
    elseif step == "]" then
      program = program.."end\n"
    end
  end
  -- Return tape at end of the program
  program = program .. "return tape\n\n"
  return program
end

-- Smallfuck interpreter.
-- Arguments:
--    code : Smallfuck program to execute.
--    tape : Run program on this tape.
-- Return:
--    Content of the tape after program run.
function interpreter(code, tape)
  -- Translate into lua code
  local program = smallfuck2lua(code,tape)
  -- load the lua code
  program = load(program)
  -- execute the code
  tape = program()
  -- convert boolean tape into string
  local result = ""
  for _,t in ipairs(tape) do
    if t then
      result=result.."1"
    else
      result=result.."0"
    end
  end
  return result
end

return interpreter
