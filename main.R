## TK
## 2019/04/09


# start operations
globalVariables = list() # create empty list for global variables
globalVariables[['wd']] <- dirname(rstudioapi::getSourceEditorContext()$path) # get working directory
setwd(globalVariables$wd) # set working directory

globalVariables[['requiredPackages']] <- c('dplyr', 'Hmisc', 'corrplot') # required packages


# load data from files
source('scripts/tools/functions.R') # load user-defined functions

loadInstall(globalVariables$requiredPackages) # load/install requred packages


# source('scripts/data/cleanData.R')
# list of loaded packages
# sessionInfo()