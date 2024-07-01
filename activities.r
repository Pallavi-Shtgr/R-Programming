#exploring inbuilt datasets
data()
view(msleep)
summary(msleep)
names(msleep)

#?drop_na

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


