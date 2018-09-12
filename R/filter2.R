#filter
#
#

filter2 <- function(dataFile,time,column,...){
  if (grepl("y$", tolower(time))){
    require(lubridate)
    dplyr::filter(dataFile,minute(coulmn) == ...)        
    }
  else if (grepl("n$", tolower(time))){
require(sqldf)
  sqldf(paste0("SELECT * FROM dataFile WHERE ",...))

#  eval(parse(text=paste0("dplyr::filter(dataFile,",dd,")")))
#  return(dataFile)
    }
}

