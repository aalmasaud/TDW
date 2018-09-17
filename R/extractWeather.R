#extractWeather
#
#


extractWeather <- function(dataFile,toColumn){

    for(i in 1:nrow(dataFile)) {
    tempStr <- dataFile[i,Weather_phenomena]
    if(grepl("fog$", tolower(type)))
    c[i] <- "Fog"
    if(grepl("rain$", tolower(type)))
      c[i] <- "Rain"
    if(grepl("hail$", tolower(type)))
      c[i] <- "Hail"
    if(grepl("snow$", tolower(type)))
      c[i] <- "Snow"
    if(grepl("snow$", tolower(type)))
      c[i] <- "Snow"
    }
  dataFile[toColumn] <- c
  return(dataFile)
}
