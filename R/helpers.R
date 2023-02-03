#' Helper functions
#' 
#' Technically this install the packages listed in a vector
#' @author Marcelo Pires <marcpiresrj@gmail.com> 
#' @return none
#' @examples pkginstall(c("tidyverse","ggplot"))

library(base)
library(kableExtra)

#TODO: Not working when called from analysis.R
print_table <- function(dataset) {
    dataset %>%
    kable() %>%
    kable_styling(bootstrap_options = "striped", 
                full_width = FALSE,
                font_size = 20)
}