require(dplyr)

bmi <- function(weight, height) {
  index <- weight/height**2
  case_when(
    index <= 18.5 ~ "Underweight",
    index <= 25.0 ~ "Normal",
    index <= 30.0 ~ "Overweight",
    TRUE          ~ "Obese"
  )
}