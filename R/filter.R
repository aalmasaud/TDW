#filter
#
#

filter <- function(dataFile,...){

  library(data.table)
  d <- gsub(" AND ", " & ", paste(..., collapse = ""))
  dd <- gsub(" OR ", " | ", d)
  setDT(dataFile)
  print(paste0("dt[",dd,"]"))

 # eval(parse(text=paste0("dt[",dd,"]")))
#  return(dataFile)
}

