

roundToNearestHour <- function(dataFile,type,fromColumn,toColumn,...) {
  if (grepl("trunc$", tolower(type))){
    res <- format(substring(trunc(as.POSIXct(dataFile[,fromColumn],usetz = FALSE),"hour"),1,19),format="%Y-%m-%d %H:%M:%S")
    dataFile[toColumn] <- res
    return(dataFile)
    }

  else if (grepl("round$", tolower(type))){
    res <- format(substring(round(as.POSIXct(dataFile[,fromColumn],usetz = FALSE),"hour"),1,19),format="%Y-%m-%d %H:%M:%S")
    dataFile[toColumn] <- res
    return(dataFile)
  }

  else
    stop("type must be trunc or round!")
}
