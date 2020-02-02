library(nleqslv)

# Define the function you want to solve for
fn <- function(x) {
  return(x^6 - 2*x^4 + 4*x^3 - 3*x^2 - 4*x + 4)
}

# Use nleqslv::nleqslv() to solve the function
# The first parameter is an initial guess for the root of the function
# A root is a value for which a given function equals zero
nleqslv(1, fn)
