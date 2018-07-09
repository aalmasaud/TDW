#filter
#
#

filter <- function(dataFile,...){

  library(data.table)
  d <- gsub(" AND ", " & ", paste(..., collapse = ""))
  print(d)
  dd <- gsub(" OR ", " | ", d)
  print(as.logical(dd))
  e<-paste("dataFile[",dd,"]")
  print(parse(text=e))
#  return(dataFile)
}

