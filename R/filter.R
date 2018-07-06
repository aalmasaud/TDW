#filter
#
#


filter <- function(dataFile,...){

  library(data.table)

  d <- gsub(" AND "," & ",paste(...,collapse = ""))
  print(d)
  dd <- gsub(" OR "," | ",d)
  print(dd)
  dT <- data.table(dataFile)
  dT[noquote(dd)]

  }

