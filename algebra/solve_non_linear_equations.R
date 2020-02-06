library(nleqslv)
library(tidyverse)
library(plotly)

# Explore behaviour of function via simulation
func_values <- vector(mode = "numeric")
for (i in 1:20000) {
  x <- i - 10000
  
  func_values <- c(func_values,
                   x^6 - 2*x^4 + 4*x^3 - 3*x^2 - 4*x + 4)
  
  # Could be defined outside of the for loop as well
  names(func_values)[i] <- x
}

# Create interactive plot of function
# Note that the plot is a bit misleading since many values
# on the y-axis are huge! However, the plot gives an idea about the
# behavior of the function
func_plot <-tibble(x_value = as.numeric(names(func_values)),
                   func_value = func_values) %>% 
  ggplot(aes(x = x_value, func_value)) +
  geom_line() +
  theme_bw()

ggplotly(func_plot)

# Check which values are exactly 0
roots <- func_values[func_values == 0]

# Using nleqslv::nleqslv() to solve the function
# Define the function you want to solve
fn <- function(x) {
  return(x^6 - 2*x^4 + 4*x^3 - 3*x^2 - 4*x + 4)
}

# The first parameter is an initial guess for the root of the function
# A root is a value for which a given function equals zero
# Function values from the simuation that equal 0 can be used as initial guesses
map(c(-2, -1, 1), ~ nleqslv(.x, fn))
