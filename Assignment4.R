library(gapminder)
library(here)
library(tidyverse)
library (socviz)

library(readr)
WOT.data <- read.csv("WOT.csv")


WOT.filtered <- filter(WOT.data, Battles > 3)
WOT.filtered$WR <- sub("%", "", WOT.filtered$WR)
WOT.filtered$WR <- as.numeric(WOT.filtered$WR)

p <- ggplot(data=WOT.filtered, 
            mapping = aes(x = reorder (Nation, WR, na.rm=TRUE), y = WR))
plot_1 <- p + geom_boxplot() +
  labs(x = "Nation Played", 
       y = "Win Rate", 
       title = "Statistics by Nation Played") 

q <- ggplot(data=WOT.filtered,
            mapping = aes(x = reorder (Class, WR, ma.rm=TRUE), y = WR))
plot_2 <- q + geom_boxplot() +
  labs(x = "Type Played", 
       y = "Win Rate", 
       title = "Statistics by Type Played") 

gridExtra::grid.arrange(
  plot_1,
  plot_2,
  ncol=2
)



