#filter
#
#


filter <- function(dataFile,...){

  d <- gsub(" AND "," & ",paste(...,collapse = ""))
  print(d)
  dd <- gsub(" OR "," | ",d)
  print(dd)
  filter_(dataFile,dd)


  }

