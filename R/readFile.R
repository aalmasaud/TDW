# readFile
#
#

library(httr)
readFile <- function(type,file,...) {

  if(grepl("csv$", tolower(type))){
    read.csv(file,stringsAsFactors=FALSE, ...);
  }
  else if (grepl("json", tolower(type))){
    library(jsonlite)
    fromJSON(file)
  }
  else
    stop("input file must be a .csv or JSON file!")
}
