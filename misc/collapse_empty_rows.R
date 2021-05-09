library(tidyverse)
test_data <- data.frame(id = c(rep(1, 3), rep(2, 3)),
                        value1 = c(NA, NA, "sfsdfsf" ,NA, NA, "dfsdf"),
                        value2 = c(NA, "fdgdfg", NA, NA, "sdfsfd", NA),
                        value2 = c(NA, "fdgdfg", NA, NA, "sdfsfd", NA)) 

test_data %>% 
  group_by(id) %>% 
  mutate_all(~ ifelse(is.na(.), "", .)) %>% 
  summarise_all(function(x) paste0(x, collapse = ""))

