#importing csv file
covid_data <- read.csv("covid-19-26.csv") (Search CSV file download in google)
view(covid_19_26)

#manipulating csv file data
covid_data %>% 
  select(id,gender,age) %>% 
  filter(age<50) %>% 
  arrange(age)


