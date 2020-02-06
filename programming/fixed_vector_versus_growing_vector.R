fixed_vec <- function() {
  func_values <- vector(mode = "numeric", 200)
  for (i in 1:200) {
    x <- i - 100
    
    func_values[i] <- (x^6 - 2*x^4 + 4*x^3 - 3*x^2 - 4*x + 4)
    
  }
  return(func_values)
}

grow_vec <- function() {
  func_values <- vector(mode = "numeric")
  for (i in 1:200) {
    x <- i - 100
    
    func_values <- c(func_values,
                     (x^6 - 2*x^4 + 4*x^3 - 3*x^2 - 4*x + 4))
    
  }
  return(func_values)
}

microbenchmark(fixed_vec(), grow_vec())
