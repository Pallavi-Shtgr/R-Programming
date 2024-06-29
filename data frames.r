#creating data frame
name <- c("a","b","c")
age <- c(20,21,19)
gender <- c("m","f","m")

my_data <- data.frame(name,age,gender)
View(my_data)


#manipulating data
my_data$age
my_data[ , ]
my_data[2,3]
my_data[1:3]
my_data[1:2,1]
my_data[my_data$age<50,1:2]

