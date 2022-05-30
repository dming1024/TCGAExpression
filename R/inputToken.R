

#' Token
#'
#' @param tokenValues Get your token:  http://yixuetongji.top/TCGAToken/
#'
#' @return
#' @export
#'
#' @examples
#' library(TCGAExpression)
#' inputToken("yJ0eXAiOiJKV1QiLCJhbGciOiJI...xNjUzODMyOTAyLjM4NTU3MzksImlzcyI6Inl4d")
inputToken<-function(tokenValues){
  tokenFile = system.file("extdata", "token", package = "TCGAExpression")
  writeLines(tokenValues,tokenFile)
}


getToken <- function() {
  tokenFile = system.file("extdata", "token", package = "TCGAExpression")
  tmp = readLines(tokenFile)
  return(tmp)
}
