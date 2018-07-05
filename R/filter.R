#filter
#
#


filter <- function(dataFile,...){

  d <- gsub(" AND "," & ",paste(...,collapse = ""))
  dd <- gsub(" OR "," | ",d)
  dataFile %>% filter_(dd)


  }

