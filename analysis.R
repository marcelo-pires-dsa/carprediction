source("./R/helpers.R")
source("./R/plots.R")

getwd()
# load dataset
car_dataset <- read.csv("./data/cardetails-clean.csv")

# Verify data distribution
histo <- hist(car_dataset$price, breaks = 100)
savePlot(histo, filename = "./plots/y_disttribution.png", type = "png")

# Verify distribution of dependent variable
#hist_graph <- histogram(car_dataset, car_dataset$price, 
#                        label_x = "Kilometers",
#                        label_y = "price",
#                        title = "Price")

ggsave(filename = "y_distribution.png", plot = hist_graph,
       path = "./plots/", device = "png")

sample <- head(car_dataset, n = 100)

# Summary of dataset
dataset_summary <- summary(car_dataset)

#Save the summary in the ouput folder
capture.output(dataset_summary, file = "./output/dataset_summary")

# Coefficient of determination. 0.0227
r2 <- paste("R²:", round(((cor(car_dataset$kilometer, car_dataset$price))^2),4))
r2_sample <- paste("R²:", round(((cor(sample$kilometer, sample$price))^2),4))

sct_plot <- scatter_plot(car_dataset,
             point_x = car_dataset$kilometer, 
             point_y = car_dataset$price,
             label_x = "Kilometragem", 
             label_y = "Preço",
             plot_file = "grafico_dispersao.svg",
             plot_title = r2,
             plot_path = "./plots/")

ggsave(filename = "grafico_dispersao.png", plot = sct_plot, 
           path = "./plots/", device = "png")


# Model estimation
price_model <- lm(formula = car_dataset$price ~ car_dataset$kilometer,
                  data = car_dataset)

# analysis of variance 
variance_analysis <- anova(price_model)

# Observe model params
summary(price_model)

sum(price_model, confint = T, digits = 4, ci.width = .95)
export_sums(price_model, scale = F, digits = 4)

# view model. TODO: Add to a helper
extract_eq(price_model, use_coefs = T) %>%
  kable() %>%
  kable_styling(bootstrap_options = "stripped",
                full_width = F,
                font_size = 28)

predict(price_model, data.frame(kilometer = 87150))
