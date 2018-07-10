#filter
#
#

filter <- function(dataFile,...){

  library(data.table)
  d <- gsub(" AND ", " & ", paste(..., collapse = ""))
  print(d)
  dd <- gsub(" OR ", " | ", d)
  setDT(dataFile)
  e<-paste("dt[",dd,"]")
  eval(parse(text=e))
#  return(dataFile)
}

