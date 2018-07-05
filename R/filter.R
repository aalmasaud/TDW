#filter
#
#


filter <- function(dataFile,...){

  d <- gsub(" AND "," & ",...)
  dd <- gsub(" OR "," | ",d)
  dataFile %>% filter_(dd)


  }
