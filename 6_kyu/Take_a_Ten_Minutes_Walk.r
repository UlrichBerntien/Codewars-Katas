# Check the walk plan.
# The walk plan is a list of same length segments in the diretions n,s,w or e.
# The walk plan must contain exact 10 steps.
# The walk must return to the start position
isValidWalk <- function(walk){
  if(length(walk) != 10) return(FALSE)
  steps <- table(walk)
  sum(steps[c('n', 's', 'w', 'e')],na.rm=TRUE) == 10 && equalNA(steps['s'],steps['n']) && equalNA(steps['e'],steps['w'])
}

# Values are equal or both are NA.
equalNA <- function(a,b) ifelse(is.na(a) || is.na(b), is.na(a)==is.na(b), a == b)
