#Install required packages for scChIP seq Shiny App if they are not installed

usePackage <- function(p)
{
  if (!is.element(p, installed.packages()[, 1]))
    install.packages(p,repos='http://cran.rstudio.com/', dep = TRUE)
  require(p, character.only = TRUE)
}
# usePackageGeco <- function(p)
# {
# 	
#   if (!is.element(gsub(".tar.gz", "",p), installed.packages()[, 1]))
#     install.packages(file.path("packages",p), repos = NULL, type = "source")
#   require(p, character.only = TRUE)
# }



#R CRAN
pkgs = c(
  "BiocManager",
  "shiny",
  "shinyjs",
  "shinydashboard",
  "tibble",
  "dplyr",
  "stringr",
  "irlba",
  "reshape2",
  "Rtsne",
  "DT",
  "tidyr",
  "splitstackshape",
  "DT",
  "tidyr",
  "rlist",
  "plotly",
  "RColorBrewer",
  "colorRamps",
  "colourpicker",
  "kableExtra",
  "knitr",
  "viridis",
  "ggplot2",
  "gplots",
  "png",
  "gridExtra"
)
for (pkg in pkgs) {
  usePackage(pkg)
}

#Functions
usePackageBioc <- function(p)
{
  if (!is.element(p, installed.packages()[, 1]))
    if(as.numeric(R.Version()$minor) < 6) {
      BiocManager::install(p, dep = TRUE, version = "3.8")
    } else {
      BiocManager::install(p, dep = TRUE, version = "3.9")
    }
  require(p, character.only = TRUE)
}

#Biocmanager
  pkgs_bioc = c("scater",
              "scran",
              "ConsensusClusterPlus",
              "GenomicRanges",
              "IRanges")

for (pkg in pkgs_bioc) {
 usePackageBioc(pkg)
}

#geco local packages
# pkgs_geco = c(
#   "geco.utils.tar.gz",
#   "geco.visu.tar.gz",
#   "geco.unsupervised.tar.gz",
#   "geco.supervised.tar.gz"
# )
# for (pkg in pkgs_geco) {
#   usePackageGeco(pkg)
# }


#ShinyDirectoryInput
if (!is.element("shinyDirectoryInput", installed.packages()[, 1])){
  if(!is.element("devtools", installed.packages()[, 1])){
   install.packages("devtools")
   devtools::install_github('wleepang/shiny-directory-input')
  } else{
  devtools::install_github('wleepang/shiny-directory-input')
  }
}

