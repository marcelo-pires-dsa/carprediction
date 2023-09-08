library(tidyverse)
library(ggcorrplot)

source("./R/helpers.R")
source("./R/plots.R")

# Get arguments from command line
args <- commandArgs(trailingOnly = T)

# load dataset
car_dataset <- read.csv("./data/cardetails-clean.csv")

features <- c("year", "kilometer","price")

selected_features <- car_dataset %>% 
  select(all_of(features))

# Calcula a correlação entre as variáveis
corr <- cor(selected_features)

# Exibe a matrix de correçalação
ggcorrplot(corr)

# Dataset structure
str(car_dataset)

glimpse(car_dataset)

#car_sample <- head(car_dataset, n = 120)

# Summary of dataset
dataset_summary <- summary(car_dataset)

# Save the dataset summary in the ouput folder
capture.output(dataset_summary, file = "./output/dataset_summary")

# Correlation Matrix between variables


#TODO: Check error below
# Error stop("no such device") : 
# the condition has length > 1
#savePlot(histo, filename = "./plots/car_price_data_disttribution.png", type = "png")

# Coefficient of determination for the plot title
R2 <- paste("R squared:", round(((cor(car_dataset$price, car_dataset$kilometer))^2),4))

# Verify distribution of dependent variable
pricekm_plot <- scatter_plot(car_dataset,point_x = car_dataset$kilometer,
                           point_y = car_dataset$price,
                           label_x = "Kilometer",
                           label_y = "Price", 
                           plot_title = paste(R2, "Price vs Kilometers"),
                           plot_file = "price_x_kilometer.png",
                           plot_path = "./plots/")


ggsave(filename = "car_price_y_distribution.png", plot = pricekm_plot,
       path = "./plots/", device = "png")
