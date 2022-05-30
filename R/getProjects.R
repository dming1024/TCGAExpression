
#' Get TCGA Project List
#'
#' @return 33 TCGA Projects List
#' @export
#'
#' @examples
#' library(TCGAExpression)
#' getProjects()
getProjects<-function(){
  tmp = system.file("extdata", "TCGA.csv", package = "TCGAExpression")
  df=read.csv(tmp,header = T,check.names = F)
  return(df)
}
