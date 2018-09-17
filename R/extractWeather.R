#extractWeather
#
#


extractWeather <- function(dataFile,fromColumn,toColumn){
    
    c <- character(nrow(dataFile))

    for(i in 1:nrow(dataFile)) {
    tempStr <- dataFile[i,fromColumn]
    if(grepl("fog$", tolower(tempStr)))
    c[i] <- "Fog"
    if(grepl("wind$", tolower(tempStr)))
    c[i] <- "Wind"
    if(grepl("rain$", tolower(tempStr)))
      c[i] <- "Rain"
    if(grepl("hail$", tolower(tempStr)))
      c[i] <- "Hail"
    if(grepl("snow$", tolower(tempStr)))
      c[i] <- "Snow"
    }
  dataFile[toColumn] <- c
  return(dataFile)
}
