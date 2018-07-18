#enrichTimestamp2
#
#

enrichTimestamp2 <-function(dataFile,startDate,fromColumn,toColumn,...) {
  c<-0
  tmp <- "00"
  tmp2 <- "00"
  fromDate <- as.Date(startDate)

  if (nchar(dataFile[1, fromColumn])<9 & nchar(dataFile[floor(nrow(dataFile)/2), fromColumn])<9 & nchar(dataFile[nrow(dataFile), fromColumn])<9) {

    res <- character(nrow(dataFile))

    for(i in 1:nrow(dataFile)) {

      tempStr <- dataFile[i, fromColumn]

        tmp<-substr(tempStr,0,2)
        if (tmp<tmp2)
          if (c<23)
            c<-c+1
        else {
          c<-0
          fromDate<-fromDate+1
        }

        if (c<10)
          res[i] <- paste(fromDate," ","0",c,":",tempStr, sep="")
        else
          res[i] <- paste(fromDate," ",c,":",tempStr, sep="")
        tmp2<- tmp
      }


    dataFile[toColumn] <- res

  }

  return(dataFile)


}
