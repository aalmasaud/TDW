#filter
#
#


filter <- function(dataFile,...){

a <-gsub("\r?\n|\r", " ",paste(...,collapse = ""))
  #d <- gsub(" AND "," & ",a)
  #print(d)
  #dd <- gsub(" OR "," | ",d)
  #print(dd)
  
  #dataFile %>% filter_(dd)


  }

