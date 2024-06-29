#exploring inbuilt datasets
data()
view(msleep)
summary(msleep)
names(msleep)

#?drop_na

#
is.na(msleep)
colSums(is.na(msleep))
summary((is.na(msleep)))


#drop na,grouping,avg,max
msleep %>% 
  drop_na(sleep_rem,vore,) %>% 
  group_by(order) %>% 
  summarise('average sleep'=mean(sleep_total),
            'maximun rem sleep'=max(sleep_rem)) %>% 
  view()
 
#  
view
?str
?levels
levels(msleep$vore)
?na.omit
?mutate
?aes
?labs

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


#manipulating data using ends with 
starwars %>% 
  select(name,height,ends_with("color")) %>% 
  names()


#manipulating using filter
starwars %>% 
  select(name,height,ends_with("color")) %>% 
  filter(hair_color %in% c("blond","brown") & height<180) %>% 
  view()


#cleaning data using omit
starwars %>% 
  select(name,hair_color,height) %>% 
  na.omit()

#highlighting all missing values
starwars %>% 
  select(name,hair_color,height) %>% 
  filter(!complete.cases(.))


#droping na only desired
starwars %>% 
  select(name,hair_color,height) %>% 
  filter(!complete.cases(.)) %>% 
  drop_na(height)


#using mutate and replacing na with values
starwars %>% 
  select(name,hair_color,height) %>% 
  filter(!complete.cases(.)) %>% 
  mutate(hair_color1=replace_na(hair_color,"none"))


#duplicate
names <- c("aman","gopi","bhanu","gopi")
age <- c(20,21,30,21)
friends <- data.frame(names,age)
view(friends)

duplicated(friends)

friends[duplicated(friends),]

friends %>% 
  distinct() %>% 
  view()

#using mutate and changing values of a parameter
starwars %>% 
  select(name,hair_color,height,gender) %>% 
  mutate(gender=recode(gender,
                        "masculine"=1,
                        "feminine"=2))

#graph plotting
barplot(starwars$mass)
hist(starwars$height)


#designing graph

msleep %>% 
  drop_na(vore) %>% 
  ggplot(aes(x=vore))+
  geom_bar(fill = "#97B3C6")+
  #coord_flip()+
  theme_bw()+
  labs(x="vore",
       y="sleep hrs",
       title ="drawing bar graph" )

msleep %>% 
  drop_na(vore) %>% 
  ggplot(aes(x = awake))+ 
  geom_histogram(binwidth=1 , fill= "#97B3C6")+
  theme_bw()+
  labs(x="total sleep",
       y="value",
       title="drawing histogram")


#scatter plotting
data(mpg)
view(mpg)

mpg %>% 
  filter(hwy < 35) %>% 
  ggplot(aes(x=displ,
         y=hwy,
         colour=drv))+
  geom_point()+
  geom_smooth(method=lm,
              se=F)+
  labs(x="engine size",
       y="mpg on highway",
       title="fuel efficiency")+
  theme_minimal() # + ggsave("name whatever you want to save")
  

#linear regression

data(cars)
view(cars)

mod <- cars %>%
  lm(dist ~ speed , data=.) %>% 
  summary()

ggplot(cars, aes(x = speed, y = dist)) +
  geom_point() +                  
  geom_smooth(method = "lm",      
              se = FALSE,         
              color = "blue") +
  labs(title = "Linear Regression of Distance vs Speed",
       x = "Speed", y = "Distance")

attributes(mod)
hist(mod$residuals)

?attributes


#analysis of variance(anova)

data(msleep)
msleep %>% 
  select(vore,sleep_rem) %>% 
  drop_na() %>% 
  aov(sleep_rem~vore,data=.) %>% 
  summary()

ggplot(msleep, aes(x = vore, y = sleep_rem)) +
  geom_boxplot() +
  labs(
    title = "Sleep REM by Feeding Behavior (vore)",
    x = "Feeding Behavior (vore)",
    y = "Sleep REM"
  ) +
  theme_minimal()
