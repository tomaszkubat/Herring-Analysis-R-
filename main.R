## TK
## 2019/04/09


# start operations
globalVariables = list() # create empty list for global variables
globalVariables[['wd']] <- dirname(rstudioapi::getSourceEditorContext()$path) # get working directory
setwd(globalVariables$wd) # set working directory

globalVariables[['requiredPackages']] <- c('dplyr') # required packages


# load data from files
source('scripts/tools/functions.R') # load user-defined functions

loadInstall(globalVariables$requiredPackages) # load/install requred packages


# how to clean data by lapply
# https://www.guru99.com/r-apply-sapply-tapply.html#5
