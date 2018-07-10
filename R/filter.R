#filter
#
#

filter <- function(dataFile,...){

  library(data.table)
  d <- gsub(" AND ", " & ", paste(..., collapse = ""))
  dd <- gsub(" OR ", " | ", d)
  #setDT(dataFile)
  print(paste0("dataFile[",dd,"]"))

  eval(parse(text=paste0("dataFile[",dd,",]")))
#  return(dataFile)
}

