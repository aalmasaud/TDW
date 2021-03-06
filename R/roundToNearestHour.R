

roundToNearestHour <- function(dataFile,type,fromColumn,...) {
  if (grepl("trunc$", tolower(type))){
    res <- trunc(strptime(dataFile[,fromColumn],"%Y-%m-%d %H:%M:%S"), units="hour")
    dataFile$Hour <- as.POSIXct(res)
    return(dataFile)
    }

  else if (grepl("round$", tolower(type))){
    res <- round(strptime(dataFile[,fromColumn],"%Y-%m-%d %H:%M:%S"), units="hour")
    dataFile$Hour <- as.POSIXct(res)
    return(dataFile)
  }

  else
    stop("type must be trunc or round!")
}
