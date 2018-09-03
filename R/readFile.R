# readFile
#
#

library(httr)
readFile <- function(type,file,...) {

  if(grepl("csv$", tolower(type))){
    data <- read.csv(file,stringsAsFactors=FALSE, ...);

  }
  else if (grepl("json", tolower(type))){
    library(jsonlite)
    data <- fromJSON(file)
  }
  else if (grepl("xls",tolower(type))){
    readxl::read_xls(file,skip=6,...)
  }
  else
    stop("input file must be a .csv or JSON file!")

  names(data)<- gsub("\\.","_",name(data))
  return(data)
}
