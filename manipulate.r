#manipulating data using ends with 
starwars %>% 
  select(name,height,ends_with("color")) %>% 
  names()


#manipulating using filter
starwars %>% 
  select(name,height,ends_with("color")) %>% 
  filter(hair_color %in% c("blond","brown") & height<180) %>% 
  view()
