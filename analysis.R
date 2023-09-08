library(tidyverse)
library(ggcorrplot)
library(neptune)
library(tidymodels)

# Handles package conflicts
tidymodels_prefer(quiet = F)

source("./R/helpers.R")
source("./R/plots.R")

run <- neptune_init(
  project="marcpires--dsa/car-price-prediction",
  api_token=Sys.getenv("NEPTUNE_API_TOKEN"),
  name = "Data Analysis",
  description = "Project aims to predict a car give, using regression models",
  capture_hardware_metrics = T,
  capture_stderr = T,
  capture_stdout = T,
  capture_traceback = T)


# Get arguments from command line
args <- commandArgs(trailingOnly = T)
dataset <- "./data/cardetails-clean.csv"

# Track dataset
neptune_track_files(run["artifacts/datasets"], dataset)

#neptune_add(run["sys/tags"], ["lm", "testing"])

# load dataset
car_dataset <- read.csv(dataset)

features <- c("year", "kilometer","price")

selected_features <- car_dataset %>% 
  select(all_of(features))

#Fix histogram
#price_hist <- histogram(selected_features, point_x = selected_features$price,
#             label_x = "Year", label_y = "Price",
#             plot_title = "Car prices")


# Calcula a correlação entre as variáveis
corr <- cor(selected_features)

# Exibe a matrix de correçalação
corr %>% ggcorrplot(title = "Correlation plot",
           lab = T, ggtheme = "theme_classic")

selected_features_summary <-  summary(selected_features)
capture.output(selected_features_summary, file = "./output/dataset_summary")

# Upload plot. Will be converted to a file
neptune_upload(run["evaluation/correlation"], corr)

# Dataset structure
str(car_dataset)

glimpse(car_dataset)

#car_sample <- head(car_dataset, n = 120)

# Summary of dataset
dataset_summary <- summary(selected_features)

# Save the dataset summary in the ouput folder
capture.output(dataset_summary, file = "./output/selected-features-dataset_summary")

# Correlation Matrix between variables


#TODO: Check error below
# Error stop("no such device") : 
# the condition has length > 1
#savePlot(histo, filename = "./plots/car_price_data_disttribution.png", type = "png")

# Coefficient of determination for the plot title
R2 <- paste("R squared:", round(((cor(selected_features$price, selected_features$year))^2),4))

# Verify distribution of dependent variable
pricekm_plot <- scatter_plot(car_dataset,point_x = selected_features$year,
                           point_y = selected_features$price,
                           label_x = "Kilometer",
                           label_y = "Price", 
                           plot_title = paste(R2, "Price vs Kilometers"),
                           plot_file = "price_x_kilometer.png",
                           plot_path = "./plots/")

neptune_upload(run["evaluation/scatter-plot"], pricekm_plot)


ggsave(filename = "car_price_y_distribution.png", plot = pricekm_plot,
       path = "./plots/", device = "png")

#TODO: Move to a new file after testing

#Estimate an lm (Ordinary Linear Regression) model (price ~ year)
lm_price_model <- 
    linear_reg() %>% 
      set_engine("lm")

lm_price_fit <- lm_price_model %>% fit(price ~ year, data = selected_features)

lm_price_fit %>% extract_fit_engine() %>% summary()

# Summary  info on model components
tidy(lm_price_fit)

anova(lm_price_fit)

# Model summary
summary(lm_price_fit)

#run["evaluation/accurary"]
#run["evaluation/accurary"]

# Predict

new_values <- data.frame(year = 2022)
predict(lm_price_fit,new_data = new_values)

car_dataset %>% select(price, year) 



neptune_upload(run["model"], "output/models/lm.rds")
