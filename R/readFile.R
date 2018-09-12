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
    xlsfile <- tempfile()
    download.file(file, xlsfile, mode = 'wb')
    data <- as.data.frame(readxl::read_xls(xlsfile,skip=6,...))

  }
  else
    stop("input file must be a .csv or JSON file!")

  names(data)<- gsub("\\.","_",names(data))
  
  names(data)<- gsub(" ","_",names(data))
  return(data)
}
