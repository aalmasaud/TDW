# readFile2
#
#

library(httr)
readFile2 <- function(file,...) {

  if(grepl(".csv$", file)){
    data.table::fread(file, sep=",", dec=".", quote="\"",
          nrows=Inf, header=TRUE,
          na.strings=getOption("datatable.na.strings","NA"),
          stringsAsFactors=FALSE, verbose=getOption("datatable.verbose", FALSE),
          skip=0,
          integer64=getOption("datatable.integer64", "integer64"),
          encoding="unknown",
          strip.white=TRUE, fill=FALSE, blank.lines.skip=FALSE,
          key=NULL, index=NULL,
          data.table=getOption("datatable.fread.datatable", TRUE),
          nThread=2,
          logical01=getOption("datatable.logical01", FALSE))
  }
  else if (grepl(".json$", file)){
    library(jsonlite)
    fromJSON(file)
  }
  else
    stop("input file must be a .csv or JSON file!")
}
