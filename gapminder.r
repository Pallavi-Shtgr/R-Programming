#installing gapminder and exploring it
install.packages("gapminder")
library(gapminder)
?gapminder
data(gapminder)
View(gapminder)

#using gapminder tools
gapminder %>% 
  separate(col = year,
  into = c("century", "year"), 
  sep = 2) %>% 
  View()


#using orange dataset & exploring piviot wider
orange2 <- Orange %>% 
  pivot_wider(names_from ="age",
             values_from = "circumference")


rm(orange2)

#using piviot longer
view(orange2) 
orange2 %>% 
  pivot_longer(cols = 2:8,
               names_to = "age",
               values_to = "circumference") %>% 
  view()


#using starwars dataset
view(starwars)
glimpse(starwars)    
unique(starwars$gender)


library(dplyr)


#converting datatype into factor (to make it use for categorical analysis)
starwars$gender1 <- as.factor(starwars$gender)
#use levels 

?as.factor


class(starwars$gender)
class(starwars$gender1)
starwars$gender1 <- NULL



