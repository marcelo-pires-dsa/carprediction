library(tidyverse)
library(dplyr)

car_dataset <- read.csv("./data/cardetails-clean.csv")

car_dataset %>% head(n = 25)
