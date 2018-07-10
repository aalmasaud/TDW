#filter
#
#

filter2 <- function(dataFile,...){
require(sqldf)
  sqldf(paste0("SELECT * FROM dataFile WHERE ",...))

#  eval(parse(text=paste0("dplyr::filter(dataFile,",dd,")")))
#  return(dataFile)
}

