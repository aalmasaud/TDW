# insertToDB
#
#
#

insertToDB <- function(dataFile,nameDB,...) {
  require(RMySQL)
  
  con <- dbConnect(MySQL(),
                   user="root", password="",
                   dbname=nameDB, host="localhost", port=3306)
  chunks = 100 
  for (i in 1:ceiling(nrow(dataFile)/chunks)) {
    q = 'INSERT INTO Vehicle_Profiles (date, start_time, average_length, max_speed, average_speed, speed_factor, std_dev_factor, distribution, vehicle_count, acceleration, deceleration) VALUES '
    records = NULL
    for (j in 1:chunks) {
      r = (i-1)*chunks+j
      if (r <= nrow(dataFile)) {
        records[j] = paste0('(', paste0(dataFile[r,"date"],dataFile[r,"time"],dataFile[r,"Length__m_.avg"],dataFile[r,"Speed__mph_.max"],dataFile[r,"Speed__mph_.avg"],dataFile[r,"Speed_factor"],dataFile[r,"factor_deviation"],dataFile[r,"distribution"],dataFile[r,"Speed__mph_.count"],dataFile[r,"acc"],dataFile[r,"deac"],collapse = ','), ')')
      }
    }
    query = paste0(q, paste0(records,collapse=','))
    dbExecute(con, query)
  }
  dbDisconnect(con)
  
}
