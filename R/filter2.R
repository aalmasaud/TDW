#filter
#
#

filter2 <- function(dataFile,...){
require(sqldf)
  sqldf(paste0("SELECT * FROM dataFile WHERE ",...))
    }
}

