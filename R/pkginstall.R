#' Install packages
#' 
#' Technically this install the packages listed in a vector
#' @author Marcelo Pires <marcpiresrj@gmail.com> 
#' @return none
#' @examples pkginstall(c("tidyverse","ggplot"))
pkginstall <- function(packages) {
  if(sum(as.numeric(!packages %in% installed.packages())) != 0) {
  installer <- packages[!packages %in% installed.packages()]
  for(i in 1:length(installer)) {
    install.packages(installer, dependencies = T, repos = "http://cran.fhcrc.org" )
    break()}
    sapply(packages, require, character = T) 
  } else {
    sapply(packages, require, character = T) 
  }
}