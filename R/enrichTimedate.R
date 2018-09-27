#enrichTimeField
#
#

enrichTimedate <-function(dataFile,fromColumn,toColumn,startDate,...) {
  c<-0
  tmp <- "00"
  tmp2 <- "00"
  date <- as.Date(startDate)

  tempStr1 <- dataFile[1, fromColumn]
  
    if (nchar(tempStr1)>9){
      res <-    trimws(stringi::stri_sub(dataFile[, fromColumn],-11))

    } else {
	res <- character(nrow(dataFile))
	for(i in 1:nrow(dataFile)) {
	
	tempStr <- dataFile[i, fromColumn]

      tmp<-substr(tempStr,0,2)
      if (tmp<tmp2)
        if (c<23)
          c<-c+1
        else {
          c<-0
          date <- date+1
        }
        if (c<10)
          res[i] <- paste(as.character(date) ," 0",c,":",tempStr, sep="")
        else
          res[i] <- paste(as.character(date) ," ",c,":",tempStr, sep="")
        tmp2<- tmp
    }

  }
  dataFile[toColumn] <- res
  return(dataFile)


}
