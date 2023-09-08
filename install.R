library(renv)

source("./R/pkginstall.R")

# Vector with packages to install
pkgs <- c("plotly", #plataforma gráfica
          "tidyverse", #carregar outros pacotes do R,
          "tidymodels",
          "ggrepel", #geoms de texto e rótulo para 'ggplot2' que ajudam a
          #evitar sobreposição de textos
          "fastDummies",
          "knitr",
          "kableExtra", #formatação de tabelas
          "splines",
          "reshape2",
          "PerformanceAnalytics",
          "correlation",
          "see",
          "ggraph",
          "nortest",
          "rgl",
          "car",
          "ggside",
          "tidyquant",
          "olsrr",
          "jtools",
          "ggstance",
          "magick",
          "cowplot",
          "emojifont",
          "beepr",
          "Rcpp",
         # "equatiomatic", # Arquived from CRAN
          "reshape2", #função 'melt'
          "PerformanceAnalytics", #função 'chart.Correlation' para plotagem
          "psych", #elaboração da fatorial e estatísticas
          "ltm", #determinação do alpha de Cronbach pela função 'cronbach.alpha'
          "Hmisc", # matriz de correlações com p-valor
          "readxl",
          "writexl", # importar e escrever arquivo Excel
          "validate", # Data validation
          "rmarkdown",
          "tinytex",
         # "multirow", # Dependencies for textView
         # "listings",
         # "setspace",
         # "caption",
         # "texPreview", # Removed from CRAN due fixes not sent
          "ggcorrplot",
          "jsonlite")

pkginstall(pkgs)

renv::snapshot()

#tinytex::install_tinytex()