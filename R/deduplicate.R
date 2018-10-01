#deduplicate
#
#


deduplicate <-function(dataFile){

  dataFile[!duplicated(dataFile),]

}
