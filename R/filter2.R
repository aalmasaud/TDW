#filter
#
#

filter2 <- function(dataFile,...){
  if(grepl("wtime", tolower(paste0(...)))){
condition <- "substr(Time,15,2) = '50'"
  }
  else 
    condition <- ...
require(sqldf)
  sqldf(paste0("SELECT * FROM dataFile WHERE ",condition))

#  eval(parse(text=paste0("dplyr::filter(dataFile,",dd,")")))
#  return(dataFile)
}

