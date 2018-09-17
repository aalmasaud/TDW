#filter
#
#

Old.filter <- function(dataFile,...){

  library(data.table)
  d <- gsub(" AND ", " & ", paste(..., collapse = ""))
  dd <- gsub(" OR ", " | ", d)


  eval(parse(text=paste0("dplyr::filter(dataFile,",dd,")")))
#  return(dataFile)
}

