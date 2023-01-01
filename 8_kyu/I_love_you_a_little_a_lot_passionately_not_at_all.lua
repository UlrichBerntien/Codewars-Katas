local TEXTS = { "I love you", "a little", "a lot", "passionately", "madly", "not at all" }

function howMuchILoveYou(nb_petals)
  return TEXTS[ 1 + (nb_petals-1) % #TEXTS ]
end

return howMuchILoveYou
