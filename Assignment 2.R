
#loading tidyverse
library(tidyverse)

#Accessing subfolder of Covid-19 Data and us-states.csv
library(readr)
us_states <- read_csv("covid-19-data/us-states.csv")

#filter the state to only be Pennsylvania
Pennsylvania <- filter(us_states, state=="Pennsylvania")
view(Pennsylvania)

#Setting n to lenght of data set 
n <- length(Pennsylvania$date)

#initializing increased cases into the data frame 
Pennsylvania$incr_cases <- 1
view(Pennsylvania)

#calculating values using the for loop for amount of increased cases 
for (i in 2:n) {
  Pennsylvania$incr_cases[i] <- (Pennsylvania$cases[i]-Pennsylvania$cases[i-1]) 
}
#examine the data 
View(Pennsylvania)


#initializing increased deaths into the data fram 
Pennsylvania$incr_deaths <- 1
view(Pennsylvania)

#calculating values using the for loop for amount of increased deaths 
for (i in 2:n) {
  Pennsylvania$incr_deaths[i] <- (Pennsylvania$deaths[i]-Pennsylvania$deaths[i-1]) 
}
#examine the data 
View(Pennsylvania)

#calculate the standard deviation of the increased cases 
sd(Pennsylvania$incr_cases)


