#installing tidyverse
install.packages("tidyverse")
library(tidyverse)
?tidyverse


#using tools of tidyverse
my_data %>% 
  select(name,age) %>% 
  filter(age<50) %>% 
  arrange(age)
