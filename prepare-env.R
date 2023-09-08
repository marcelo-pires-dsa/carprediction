source("./R/pkginstall.R")

pkg <- c("renv", "reticulate","neptune")
pkginstall(pkg)

library(renv)
library(reticulate)

#install_miniconda()

library(neptune)

neptune_install()

renv::init
renv::snapshot()

renv::snapshot()
