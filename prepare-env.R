source("./R/pkginstall.R")

pkg <- c("renv")
pkginstall(pkg)

library(renv)

renv::init
renv::snapshot()