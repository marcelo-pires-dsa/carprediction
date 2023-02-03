source("./R/helpers.R")
source("./R/plots.R")

# load dataset
car_dataset <- read.csv("./data/cardetails-clean.csv")

# Summary of dataset
dataset_summary <- summary(car_dataset)
print(dataset_summary)

#Save the summary in the ouput folder
capture.output(dataset_summary, file = "./output/dataset_summary")


#sct <- scatter_plot(car_dataset,
#             point_x = car_dataset$, 
#             point_y = incdataset$sys_mod_count,
#             label_x = "contagem de reatribuição", 
#             label_y = "Atualizações",
#             plot_file = "grafico_dispersao.svg",
#             plot_path = "./plots/")

# TODO: Add to the scatter_plot helper function
#ggsave(filename = "grafico_dispersao.png", plot = sct, 
#           path = "./plots/", device = "png")

# 1. Predict when the ticket will be resolved
# dependent variable is of character class
