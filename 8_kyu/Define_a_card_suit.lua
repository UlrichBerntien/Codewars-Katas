-- suits of the cards
local SUIT = { ['C']='clubs', ['D']='diamonds', ['H']='hearts', ['S']='spades'}

-- Returns suit of the card.
function defineSuit(card)
  -- handle invalid parameter
  if type(card) ~= 'string' or #card < 2 then
    return nil
  end
  -- last char defines the suit
  return SUIT[card:sub(-1):upper()]
end

return defineSuit
