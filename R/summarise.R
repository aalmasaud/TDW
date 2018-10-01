#summarise
#
#
#

summarise <- function(dataFile,column,funct) {
  aggregate2(dataFile[column],FUN=funct)
}
