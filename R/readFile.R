# readFile
#
#

library(httr)
readFile <- function(file,...) {

  if(grepl(".csv$", file)){
    read.csv(file,stringsAsFactors=FALSE, ...);
  }
  else if (grepl(".json$", file)){
    library(jsonlite)
    fromJSON(file)
  }
  else
    stop("input file must be a .csv or JSON file!")
}
