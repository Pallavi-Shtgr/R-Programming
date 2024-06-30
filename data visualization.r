
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
