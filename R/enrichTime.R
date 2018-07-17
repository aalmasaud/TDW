#enrichTimeField
#
#

enrichTime <-function(dataFile,fromColumn,toColumn,...) {
  c<-0
  tmp <- "00"
  tmp2 <- "00"
  res <- character(nrow(dataFile))
  for(i in 1:nrow(dataFile)) {

    tempStr <- dataFile[i, fromColumn]

    if (nchar(tempStr)>8){
      res[i] <- trimws(stringi::stri_sub(tempStr,-11))
      #res[i] <- gsub(".+\\s+", "", tempStr)

    }
    else {
      tmp<-substr(tempStr,0,2)
      if (tmp<tmp2)
        if (c<23)
          c<-c+1
        else
          c<-0
        if (c<10)
          res[i] <- paste("0",c,":",tempStr, sep="")
        else
          res[i] <- paste(c,":",tempStr, sep="")
        tmp2<- tmp
    }

  }
  dataFile[toColumn] <- res
  return(dataFile)


}
