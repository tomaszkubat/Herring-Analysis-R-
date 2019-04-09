# load list of packages (and install if necessary) 
loadInstall <- function(x){
  for(i in x) { # x - list of libraries names
    if(!is.element(i, .packages(all.available=TRUE))){ # check if package is installed
      install.packages(i, dependencies=TRUE) # install package with dependencies
    } 
    library(package=i, character.only=TRUE) # load package
  } # end for
}

# example of use
# loadInstall(c('stats','base','forecast'))
