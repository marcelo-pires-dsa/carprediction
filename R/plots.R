library(plotly)
library(ggrepel)

scatter_plot <- function(dataset, point_x, point_y , label_x, label_y, save = T, plot_file, plot_path){
  dataset %>%
    ggplot() +
    geom_point(aes(x = point_x, y = point_x),
             color = "darkorchid",
             size = 3) +
    geom_smooth(aes(x = point_x, y = point_y),
              color = "orange", 
              method = "lm", 
              formula = y ~ x, 
              se = FALSE,
              size = 1.3) +
    labs(x = label_x,
        y = label_y) +
    theme_bw()
}

#TODO: FIX
histogram <- function(dataset,point_x){
  dataset %>%
    ggplot(aes(x=point_x)) +
    geom_histogram(aes(y=after_stat(density)),
                    binwidth = .5,
                    colour="black", fill="white") +
    geom_density(alpha=.2, fill="#FF6666")

}
