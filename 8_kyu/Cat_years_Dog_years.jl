# Convert human years to tuple human, cat and dog years.
function human_years_cat_years_dog_years(human_years::Real) 
  [human_years, human_to_cat_years(human_years), human_to_dog_years(human_years)]
end

# Convert human years to cat years.
function human_to_cat_years(human_years::Real)
  human_years ≤ 1 ? 15human_years :
  human_years ≤ 2 ? 6+9human_years :
                    16+4human_years
  
end

# Convert human years to dog years.
function human_to_dog_years(human_years::Real)
  human_years ≤ 1 ? 15human_years :
  human_years ≤ 2 ? 6+9human_years :
                    14+5human_years
  
end
