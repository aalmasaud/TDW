

roundToNearestHour <- function(dataFile,type,fromColumn,toColumn,...) {
  if (grepl("trunc$", tolower(type))){
    res <- format(trunc(as.POSIXct(dataFile[,fromColumn],usetz = FALSE),"hour"),format="%Y-%m-%d %H:%M:%S")
    dataFile[toColumn] <- res
    return(dataFile)
    }

  else if (grepl("round$", tolower(type))){
    res <- format(round(as.POSIXct(dataFile[,fromColumn],usetz = FALSE),"hour"),format="%Y-%m-%d %H:%M:%S")
    dataFile[toColumn] <- res
    return(dataFile)
  }

  else
    stop("type must be trunc or round!")
}
