c <- function(){
  ff <- system.file("final/en_US/en_US.twitter.txt", 
                    package = "R.utils")
  countLines(ff)
}
b <- function(){
  ff <- file("final/en_US/en_US.twitter.txt")
  length(readLines(ff))
}
processFile = function(filepath) {
  con = file(filepath, "r")
  max = 0
  while ( TRUE ) {
    line = readLines(con, n = 1)
    if ( length(line) == 0 ) {
      break
    }
    if (nchar(line)> max){
      max = nchar(line)
    }
  }
  print(filepath)
  print(max)
  close(con)
}
processFile2 = function(filepath) {
  con = file(filepath, "r")
  love = 0
  hate = 0
  while ( TRUE ) {
    line = readLines(con, n = 1)
    if ( length(line) == 0 ) {
      break
    }
    if (grepl("love",line,fixed = TRUE)){
      love=love+1
    }
    if (grepl("hate",line,fixed = TRUE)){
      hate=hate+1
    }
  }
  print(love/hate)
  close(con)
}
processFile3 = function(filepath) {
  con = file(filepath, "r")
  while ( TRUE ) {
    line = readLines(con, n = 1)
    if ( length(line) == 0 ) {
      break
    }
    if (grepl("biostats",line,fixed = TRUE)){
      print(line)
      break
    }
  }
  close(con)
}
processFile4 = function(filepath) {
  con = file(filepath, "r")
  exact="A computer once beat me at chess, but it was no match for me at kickboxing"
  count=0
  while ( TRUE ) {
    line = readLines(con, n = 1)
    if ( length(line) == 0 ) {
      break
    }
    if (grepl(exact,line,fixed = TRUE)){
      count=count+1
    }
  }
  print(count)
  close(con)
}