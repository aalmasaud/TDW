# readFile
#
# This is an example function named 'hello'
# which prints 'Hello, world!'.
#
#
# Some useful keyboard shortcuts for package authoring:
#
#   Build and Reload Package:  'Ctrl + Shift + B'
#   Check Package:             'Ctrl + Shift + E'
#   Test Package:              'Ctrl + Shift + T'

library(httr)
readFile <- function(file,...) {
  if (length(args)==0) {
    stop("At least one argument must be supplied (input file)")
  }
  else {
  if(grepl(".csv$", file)){
    read.csv(file, ...);
  }
  else if (grepl(".json$", file)){
    library(jsonlite)
    fromJSON(file)
  }
  else
    stop("input file must be a .csv or JSON file!")
}
}
